#!/usr/bin/python
#-*- coding: utf-8 -*-

import pandas as pd
import mysql.connector
from mysql.connector.errors import Error
from mysql.connector import errorcode
import json
import datetime
import sys


SENSOR_TYPE_SQL = """
INSERT INTO SENSOR_TYPE (
   sensor_type , measure_item_code , item_order, item_code_name,
   item_code_unit , thingsplus_site_id, thingsplus_model_id , 
   thingsplus_sensor_id   )
VALUES (%s, %s, %s, %s, %s, %s, %s, %s )
"""

with open('/home/admin/collect/db_config.json', 'r') as f: 
    DB_CONFIG = json.loads( f.read() )
    
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

def uploadMetaInfo(cnx, excel_name )  : 
    data_xls = pd.read_excel( excel_name , u"1.MetaData", header=0, index_col=None)
    data_xls = data_xls.fillna('') # 결측값(nan)을 공백으로 처리함.
    
    success_count = 0
    error_count = 0
    for row_index, row in data_xls.iterrows():   
        #print('%s, %s, %s, %s, %s' % (row_index, row["sensor_type"], row[u"measure_item_code"], row["item_code_name"], row["item_order"]  )   )
        sensor_type = row["sensor_type"]
        measure_item_code = row["measure_item_code"]
        item_order = row["item_order"]
        item_code_name = row["item_code_name"]
        item_code_unit = row["item_code_unit"]
        thingsplus_site_id = row["thingsplus_site_id"]
        thingsplus_model_id = row["thingsplus_model_id"]
        thingsplus_sensor_id = row["thingsplus_sensor_id"]

        keyList = (sensor_type, )
        dataList = (measure_item_code , item_order, item_code_name, item_code_unit , thingsplus_site_id, thingsplus_model_id , thingsplus_sensor_id  )
        isOK = insertOnlyDB(cnx, SENSOR_TYPE_SQL, keyList, dataList )
        if False == isOK :
            print "SENSOR_TYPE_SQL, Fail Data :\n" + str( row )
            error_count += 1
            continue
            
        cnx.commit()
        success_count += 1
        
    print "uploadMetaInfo()  success_count = %d, error_count = %d" %(success_count, error_count )
    return error_count            
    
def main():

    argLen = len( sys.argv )
    if len( sys.argv ) < 2  : 
        print "================================================================="
        print "USAGE   : python metainfo.py  XLSX_FILE                          "
        print "example : python metainfo.py  메타데이터_v1.0(1110).xlsx  "
        print "your input command : " + str( sys.argv )
        print "================================================================="
        exit (-1)

    excel_name = sys.argv[1]
    error_count = 0

    try:
        cnx = mysql.connector.connect(**DB_CONFIG)
        error_count = uploadMetaInfo(cnx , excel_name )
      
    except mysql.connector.Error as err:
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
    print ("metainfo.py, Run Time: %d sec" %(t2-t1) )