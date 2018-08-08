#!/usr/bin/python
#-*- coding: utf-8 -*-

import pandas as pd
import mysql.connector
from mysql.connector.errors import Error
from mysql.connector import errorcode
import json
import datetime
import sys


INSTALL_LOCATION_SQL = """
INSERT INTO INSTALL_LOCATION ( 
    device_hash, device_name, change_date, base_organ, base_sitetype, base_siteinout,
    base_roomtype, site_name, site_floor, site_area, room_no, description, flag )
VALUES (%s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s, %s )
"""

INSTALL_LOCATION_CHECK = """
SELECT count(*) cnt FROM INSTALL_LOCATION  
WHERE device_hash = %s
"""

INSTALL_LOCATION_PANEL_SQL = """
INSERT INTO INSTALL_LOCATION_PANEL ( 
    device_hash, device_name, change_date, panel, power_type, power_usage, 
    phase_wire, cat_a, watt_meter, description, flag )
VALUES (%s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s )
"""

INSTALL_LOCATION_PANEL_CHECK = """
SELECT count(*) cnt FROM INSTALL_LOCATION_PANEL
WHERE device_hash = %s
"""

PANEL_HIERARCHY_SQL = """
INSERT INTO PANEL_HIERARCHY ( 
    device_hash, panel, device_name, parent_panel, child_panel, change_date, flag )
VALUES (%s, %s, %s, %s, %s, %s, %s )
"""

DEVICE_SQL = """
INSERT INTO DEVICE ( 
    device_hash, device_name, change_date, install_date, manufacturer, device_model, 
    device_type, device_order, sn, device_id, sensor_count,
    description, flag )
VALUES (%s, %s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s )
"""

DEVICE_CHECK = """
SELECT count(*) cnt FROM DEVICE
WHERE device_hash = %s
"""

DEVICE_HIERARCHY_SQL = """
INSERT INTO DEVICE_HIERARCHY ( 
    device_hash, device_name, parent_device_name, child_device_name, change_date, flag )
VALUES (%s, %s, %s, %s, %s, %s )
"""

MEASURE_LOCATION_SQL = """
INSERT INTO MEASURE_LOCATION ( 
    device_hash, sensor_id, change_date, sensor_name, site_name, site_floor, site_area,
    base_roomtype, room_no, description, flag )
VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s )
"""

MEASURE_LOCATION_CHECK = """
SELECT count(*) cnt FROM MEASURE_LOCATION
WHERE device_hash = %s AND sensor_id = %s
"""

SENSOR_SQL = """
INSERT INTO SENSOR ( 
    device_hash, sensor_id, change_date, device_name, sensor_type, sensor_model, sensor_name,
    sensor_manufacturer, description, flag )
VALUES (%s, %s, %s, %s, %s, %s,%s, %s, %s, %s )
"""

SENSOR_CHECK = """
SELECT count(*) cnt FROM SENSOR
WHERE device_hash = %s AND sensor_id = %s
"""


with open('/home/admin/collect/db_config.json', 'r') as f: 
    DB_CONFIG = json.loads( f.read() )

'''
기준정보 엑셀 파일에 아래와 같이 정의됨.
IF(F96="EPS A","A",
IF(F96="EPS B","B",
IF(F96="EPS C","C",
IF(F96="기계실","M",
IF(F96="실험실","L",
IF(F96="전기실","E",
IF(F96="공조실","G",
IF(F96="관제실","S",
IF(F96="EPS D","D",
IF(F96="전산실","I",
IF(F96="UPS","U", "X")
'''
def getBaseRoomType( section_code ) :
    type = 'ETC'
    if 'A' == section_code or 'B' == section_code or 'C' == section_code or 'D' == section_code :
        type = 'EPS'
    elif  'M' == section_code :
        type = 'MRM'
    elif  'L' == section_code :
        type = 'LAB'
    elif  'E' == section_code :
        type = 'ELE'
    elif  'G' == section_code :
        type = 'ACR'
    elif  'S' == section_code :
        type = 'CTL'        
    elif  'I' == section_code :
        type = 'COM'        
    elif  'U' == section_code :
        type = 'UPS'

    return type
        
    
def insertOnlyDB(cnx, insertQuery, keyList, dataList) :
    isOK = True
    cursor = cnx.cursor()
    dataVal = keyList + dataList
    
    try:    
        cursor.execute(insertQuery,  dataVal )     
        isOK = True
    except mysql.connector.Error as err:
        cnx.rollback()
        isOK = False    
        print("insertOnlyDB() ERROR=" + str(err) )
    finally :
        cursor.close()
        
    return isOK

    
def checkDB(cnx, checkQuery, keyList, dataList) :
    cursor = cnx.cursor()
    cursor.execute(checkQuery, keyList)
    cnt, = cursor.fetchone()
    cursor.close()
    return cnt

    
def insertCheckDB(cnx, insertQuery, checkQuery, keyList, dataList) :
    isOK = True
    cnt = checkDB(cnx, checkQuery, keyList, dataList)
    
    if cnt > 0 : 
        isOK = insertOnlyDB(cnx, insertQuery, keyList, dataList)
    else :
        cnx.rollback()
        isOK = False
        print("insertCheckDB() ERROR : cant not UPDATE or DELETE " )
    
    return isOK


def insertDB(cnx, insertQuery, checkQuery, keyList, dataList, flag ) :
    isOK = True
    if "INSERT" == flag : 
    
        cnt = checkDB(cnx, checkQuery, keyList, dataList)
        if cnt > 0 : 
            cnx.rollback()
            isOK = False
        else : 
            isOK = insertOnlyDB(cnx, insertQuery, keyList, dataList)
    else :
        isOK = insertCheckDB(cnx, insertQuery, checkQuery, keyList, dataList)

    return isOK

def uploadDeviceInfo(cnx, excel_name, change_date )  : 
    data_xls = pd.read_excel(excel_name, u"2.Devices", header=0, index_col=None)
    data_xls = data_xls.fillna('') # 결측값(nan)을 공백으로 처리함.
    row_len = len(data_xls.index)
    
    success_count = 0
    error_count = 0
    for row_index, row in data_xls.iterrows():   
        #print('%s, %s, %s, %s, %s' % (row_index, row["Flag"], row[u"설치일"], row["AT(A)"], row["Device name"]  )   )
        
        flag = row["Flag"]
        if len(flag) <= 1:
            flag = 'INSERT'

        device_hash = str( row["Device ID(hash)"] )
        if len( device_hash ) <= 1 :
            print "has not Device ID(hash), Fail Data :\n" + str( row )
            error_count += 1
            continue
        
        device_name = row["Device name"]
        #site_name_rule =  device_name.split(':')[0]
        #panel_name_rule =  device_name.split(':')[1]
        #tag_name_rule =  device_name.split(':')[2]
        location_code = row['Location Code']
        
        base_organ = row["Organ code"]
        if len(base_organ) <= 1:
            base_organ = 'PTH'
        base_sitetype = row["Site Type code"]
        if len(base_sitetype) <= 1:
            base_sitetype = 'RE'
        base_siteinout = row["In/Out code"]
        if len(base_siteinout) <= 1:
            base_sitetype = 'IN' 
        base_roomtype = getBaseRoomType( location_code ) 
        site_name = row['Building Code']
        site_floor = str( row['Floor'] )
        site_area = row['Location Code']
        #room_no = row["Room"]
        room_no = ''
        description = row['Location detail']

        keyList = (device_hash, )
        dataList = (device_name, change_date, base_organ, base_sitetype, base_siteinout, base_roomtype, site_name, site_floor, site_area, room_no,  description , flag  )
        isOK = insertDB(cnx, INSTALL_LOCATION_SQL, INSTALL_LOCATION_CHECK, keyList, dataList, flag )
        if False == isOK :
            print "INSTALL_LOCATION_SQL, Fail Data :\n" + str( row )
            error_count = 1 + error_count
            continue

        panel = row['Panel']
        power_type = row['Power type']
        power_usage = row['Power usage']
        phase_wire = row['Phase/Wire']
        cat_a = row['Main CB AT(A)']
        watt_meter = row['Watt Meter(Y/N)']
        description = row['etc.']
        dataList = (device_name, change_date, panel, power_type, power_usage, phase_wire, cat_a, watt_meter, description, flag  )
        isOK = insertDB(cnx, INSTALL_LOCATION_PANEL_SQL, INSTALL_LOCATION_PANEL_CHECK, keyList, dataList, flag ) 
        if False == isOK :
            print "INSTALL_LOCATION_PANEL_SQL, Fail Data :\n" + str( row )
            error_count = 1 + error_count
            continue
        
        keyList = (device_hash, panel, )        
        up_panel = row['(Up)Panel']
        if len(up_panel) > 1:
            #print "up_panel=" + up_panel 
            for parent_panel in up_panel.split(',') :
                dataList = ( device_name, parent_panel, '', change_date , flag )        
                isOK = insertOnlyDB(cnx, PANEL_HIERARCHY_SQL, keyList, dataList )
                if False == isOK :
                    print "PANEL_HIERARCHY_SQL, Fail Data :\n" + str( row )
                    error_count = 1 + error_count
                    continue                
                    
        if False == isOK :
            continue                
        
        down_panel = row['(Down)Panel']
        if len(down_panel) > 1:
            #print "down_panel=" + down_panel
            for child_panel in down_panel.split(',') :
                dataList = ( device_name, '', child_panel, change_date , flag )        
                insertOnlyDB(cnx, PANEL_HIERARCHY_SQL, keyList, dataList )        
                if False == isOK :
                    print "PANEL_HIERARCHY_SQL, Fail Data :\n" + str( row )
                    error_count = 1 + error_count
                    continue                

        if False == isOK :
            continue
        
        install_date = str( row['Date'] )
        if  "INSTALL"==flag  and len( install_date ) < 1 : 
            install_date = change_date 
        
        manufacturer = row['Manufacturer']
        device_model = row['Device model']
        device_type = row['Device type']
        device_order = row['Device order']
        if '' == device_order :
            device_order = 0
        
        sn = row['Device S/N']
        device_id = str( row['Device ID'] ).replace('.0', '')
        
        #print ("DevcieIDHashDIC=", device_id,  device_hash )
        sensor_count = str( row['Device Channels'] )
        if len( sensor_count ) == 0:
            sensor_count = '0'
        description = row['etc..1']
        
        keyList = (device_hash, )        
        dataList = ( device_name, change_date, install_date, manufacturer, device_model, device_type, device_order, sn, device_id, sensor_count, description, flag )        
        isOK = insertDB(cnx, DEVICE_SQL, DEVICE_CHECK, keyList, dataList, flag )
        if False == isOK :
            print "DEVICE_SQL, Fail Data :" + str( row )
            error_count = 1 + error_count
            continue
    
        keyList = (device_hash, )   
        up_device = row['(Up) Device']
        if len(up_device) > 1:
            for parent_device in up_device.split('\n') :
                dataList = ( device_name, parent_device, '', change_date , flag )        
                insertOnlyDB(cnx, DEVICE_HIERARCHY_SQL, keyList, dataList )
        
        down_device = row['(Down) Device']
        if len(down_device) > 1:
            for child_device in down_device.split('\n') :
                dataList = ( device_name, '',  child_device, change_date , flag )        
                insertOnlyDB(cnx, DEVICE_HIERARCHY_SQL, keyList, dataList )

        cnx.commit()
        success_count = 1 + success_count 
        
    print "uploadDeviceInfo()  success_count = %d, error_count = %d" %(success_count, error_count )
    return error_count
    
def uploadSensorIfo(cnx, excel_name, change_date )  : 
    data_xls = pd.read_excel(excel_name, u"3.Sensors", header=0, index_col=None)
    data_xls = data_xls.fillna('') # 결측값(nan)을 공백으로 처리함.
    row_len = len(data_xls.index)

    success_count = 0
    error_count = 0
    for row_index, row in data_xls.iterrows():
        #print('%s, %s, %s, %s, %s' % (row_index, row["Flag"], row[u"Sensor Name"], row["Device Hash"], row["Sensor Capa(CT A)"]  )   )
        flag = row["Flag"]
        if len(flag) <= 1:
            flag = 'INSERT'

        #device_id = str( row["Device ID"] )
        #device_hash = DevcieIDHashDIC[ device_id ]
        device_hash  = str( row["Device hash"] )
        if len( device_hash ) <= 1 :
            print "has not Device Hash, Fail Data :\n" + str( row )
            error_count += 1
            continue            
            
        sensor_name = row["Sensor Name"]
        sensor_id = str( row["Sensor ID"] ).replace('.0', '')
        site_name = row['Building']
        site_floor = row['Floor(measure)']
        site_area = row["Zone code"]
        base_roomtype = row["Facility type"]
        room_no = row["Room"]
        description = row['Facilities'] + row['etc.'] 
        
        keyList = (device_hash, sensor_id, )  
        dataList = ( change_date, sensor_name, site_name, site_floor, site_area,  base_roomtype, room_no, description , flag )
        isOK = insertDB(cnx, MEASURE_LOCATION_SQL, MEASURE_LOCATION_CHECK, keyList, dataList, flag )
        if False == isOK :
            print "MEASURE_LOCATION_SQL, Fail Data :\n" + str( row )
            error_count = 1 + error_count
            continue

        device_name = row["Device name"]
        sensor_type = row["Sensor type"]
        sensor_model = row["Sensor model"]
        manufacturer = row["Manufacturer"]
        description = row["etc."]

        dataList = ( change_date, device_name, sensor_type, sensor_model,  sensor_name, manufacturer, description , flag )        
        isOK = insertDB(cnx, SENSOR_SQL, SENSOR_CHECK, keyList, dataList, flag )
        if False == isOK :
            print "SENSOR_SQL, Fail Data :\n" + str( row )
            error_count = 1 + error_count
            continue        
        
        cnx.commit()
        success_count = 1 + success_count 

    print "uploadSensorIfo()  success_count = %d, error_count = %d" %(success_count, error_count )
    return error_count
            
def main():
    argLen = len( sys.argv )
    if len( sys.argv ) < 2  : 
        print "================================================================="
        print "USAGE   : python baseinfo.py  XLSX_FILE                          "
        print "example : python baseinfo.py  설치기기리스트(인코어드)_v2.0(1103).xlsx  "
        print "your input command : " + str( sys.argv )
        print "================================================================="
        exit (-1)

    excel_name = sys.argv[1]
    change_date = datetime.datetime.now().strftime( '%Y%m%d%H%M%S' )
    error_count = 0

    try:
        cnx = mysql.connector.connect(**DB_CONFIG)
        cnx.autocommit = False
        error_count = uploadDeviceInfo(cnx, excel_name, change_date )
        error_count += uploadSensorIfo(cnx, excel_name, change_date )
        print "Total error_count = %d" %( error_count )

    except mysql.connector.Error as err:
        error_count = 1
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print("ERROR=" + str(err) )
    else:
        cnx.close()

    if error_count > 0 :
        exit (-1)


if __name__ == "__main__":
    import time
    t1 = time.time() # start time
    main()
    t2 = time.time() # end time
    print ("baseinfo.py, Run Time: %d sec" %(t2-t1) )
