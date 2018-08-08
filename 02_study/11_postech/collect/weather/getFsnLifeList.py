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
    (area_do,area_gu,area_dong,base_date, A01_2)
VALUES 
    (%s, %s, %s, %s, %s )
"""

updateQuery = """
UPDATE WEATHER 
    set  A01_2 = %s
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


# 식중독지수 데이터 조회
def getFsnLifeList(cnx, base_time ) :
    base_retrive_url =   "%s/%s/%s?ServiceKey=%s&areaNo=%s&time=%s&_type=json"
    
    codes = weather.CODE_INFO['식중독지수']
    for keys, loc_info in weather.LOCATION_INFOS.items():
        area_no = loc_info['AreaNo']
        retrive_url = base_retrive_url  \
                    % ( weather.DATA_GO_URL , weather.SEVICE_LIST['생활기상지수조회서비스'], weather.DETAIL_FUNCTION['식중독지수'] , \
                        weather.SERVICE_KEY, area_no ,base_time )
        req = urllib2.urlopen( retrive_url ) 
        data = json.load(req)
        #print data
        
        resultMsg = data['Response']['header']['errMsg']
        if resultMsg != '' :
            print 'Error : getFsnLifeList(%s) : %s'  % ( base_time,  resultMsg )  
            continue   
        
        to_day = base_time + '0000'
        val =  data['Response']['body']['indexModel']['today']
        #print "%s, %s, %s" %(to_day, area_no, val  )
        
        for h in range( 24 ) :         
            to_day = base_time[0:8] + '%02d' %( h )  + '0000'
            keyList = (loc_info['do'], loc_info['gu'] , loc_info['dong'] , to_day )
            dataList = ( val, )   
            weather.insertWeather(cnx, insertQuery, updateQuery, checkQuery, keyList, dataList)

def main():
    base_time = weather.getNowFormat( '%Y%m%d06' )

    error_count = 0
    try:
        cnx = mysql.connector.connect(**weather.DB_CONFIG)
        getFsnLifeList(cnx, base_time )
      
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
    print ("getFsnLifeList.py, Run Time: %d sec" %(t2-t1) )