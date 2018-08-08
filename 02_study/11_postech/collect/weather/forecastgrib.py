#!/usr/bin/python
#-*- coding: utf-8 -*-


import urllib2 
import json 
import pprint
from cStringIO import StringIO
import datetime
import weather 
import mysql.connector
from mysql.connector import errorcode


insertQuery = """
INSERT INTO WEATHER 
    ( area_do, area_gu, area_dong, base_date, T1H, RN1, SKY, UUU, VVV, REH, PTY, LGT, VEC, WSD )
VALUES 
    (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s )
"""

updateQuery = """
UPDATE WEATHER SET 
    T1H = %s , 
    RN1 = %s , 
    SKY = %s , 
    UUU = %s , 
    VVV = %s , 
    REH = %s , 
    PTY = %s , 
    LGT = %s , 
    VEC = %s , 
    WSD = %s
WHERE
    area_do = %s AND 
    area_gu = %s AND 
    area_dong = %s AND 
    base_date = %s
"""

checkQuery = """
SELECT count(*) cnt FROM WEATHER  
WHERE
    area_do = %s AND 
    area_gu = %s AND 
    area_dong = %s AND 
    base_date = %s
"""


# 초단기실황 데이터 조회
def getForecastGrib(cnx, base_date, base_time) :
    base_retrive_url =   "%s/%s/%s?ServiceKey=%s&base_date=%s&base_time=%s&nx=%s&ny=%s&pageNo=1&numOfRows=100&_type=json"
    
    codes = weather.CODE_INFO['초단기실황']    
    for keys, loc_info in weather.LOCATION_INFOS.items():
        nx = loc_info['x']
        ny = loc_info['y']
        retrive_url = base_retrive_url  \
                    % ( weather.DATA_GO_URL, weather.SEVICE_LIST['동네예보정보조회서비스'], weather.DETAIL_FUNCTION['초단기실황조회'] , \
                        weather.SERVICE_KEY, base_date, base_time, nx, ny )
        req = urllib2.urlopen( retrive_url ) 
        data = json.load(req)
        #print data 
        resultMsg = data['response']['header']['resultMsg']
        if resultMsg != 'OK' :
            print 'Error : getForecastGrib(%s, %s) ' % (base_date, base_time )  +  resultMsg
            continue
        
        totalCount = data['response']['body']['totalCount']
        
        items = {}
        to_day = ''
        for idx in range( totalCount ) :
            itemJson = data['response']['body']['items']['item'][idx]
            to_day = '%s%s00' % ( itemJson['baseDate'] , itemJson['baseTime'] )
            category = itemJson['category']
            obsrValue = itemJson['obsrValue']
            items[category] = obsrValue

        valList = []
        for codeId in codes :
            if codeId in items.keys(): 
                valList.append( str( items[ codeId ] ) )

        keyList = (loc_info['do'], loc_info['gu'] , loc_info['dong'] , to_day )
        dataList = tuple( valList )
        weather.insertWeather(cnx, insertQuery, updateQuery, checkQuery, keyList, dataList)

def main():
    WORK_DIR = '/home/admin/collect/weather'
    #fileForecastGrib = '%s/ForecastGrib_%s.csv' % (WORK_DIR,  weather.getNowFormat( '%Y%m%d%H' ) )
    base_datetime = weather.getNowFormat( '%Y%m%d%H00', prevHour=1 )
    base_date = base_datetime[ :8]  #weather.getNowFormat( '%Y%m%d' )
    base_time = base_datetime[8:]#weather.getNowFormat( '%H00', prevHour=1 )
    #base_time = '0600'
    #print ( base_date, base_time )

    error_count = 0
    try:
        cnx = mysql.connector.connect(**weather.DB_CONFIG)
        getForecastGrib(cnx, base_date, base_time )
    except mysql.connector.Error as err:
        error_count = 1
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
    else:
        cnx.close()

    if error_count > 0 :
        exit (-1)

if __name__ == "__main__":
    import time
    t1 = time.time() # start time
    main()
    t2 = time.time() # end time
    print ("forecastgrib.py, Run Time: %d sec" %(t2-t1) )
