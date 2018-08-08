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


val_key = ["h3", "h6" ,"h9" ,"h12" ,"h15" ,"h18" ,"h21" ,"h24" ]


insertQuery = """
INSERT INTO WEATHER 
    (area_do,area_gu,area_dong,base_date, A09)
VALUES 
    (%s, %s, %s, %s, %s )
"""

updateQuery = """
UPDATE WEATHER 
    set  A09 = %s
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


# 대기오염확산지수 데이터 조회
def getAirpollutionLifeList(cnx, base_time ) :
    base_retrive_url =   "%s/%s/%s?ServiceKey=%s&areaNo=%s&time=%s&_type=json"
    codes = weather.CODE_INFO['대기오염확산지수']
    for keys, loc_info in weather.LOCATION_INFOS.items():
        area_no = loc_info['AreaNo']
        retrive_url = base_retrive_url  \
                    % ( weather.DATA_GO_URL , weather.SEVICE_LIST['생활기상지수조회서비스'], weather.DETAIL_FUNCTION['대기오염확산지수'] , \
                        weather.SERVICE_KEY, area_no ,base_time )
        #print retrive_url
        req = urllib2.urlopen( retrive_url ) 
        data = json.load(req)
        #print data
        resultMsg = data['Response']['header']['errMsg']
        if resultMsg != '' :
            print 'Error : getHeatLifeList(%s) : %s'  % ( base_time,  resultMsg )  
            continue          
            
        indexModel = data['Response']['body']['indexModel']
        to_day = indexModel['date'] + '0000'
        baseDatetime = datetime.datetime.strptime(to_day, weather.INPUT_DATETIME_FORMAT)    
        
        base_hour = int( to_day[8:10] )
        for key in val_key:
            hour = int( key[1:] )
            val = indexModel[ key ]
            basedate = weather.datetimeAddHour(baseDatetime, hour)
            #print "basedate=%s, Val=%s" % (basedate  , val)
            keyList = (loc_info['do'], loc_info['gu'] , loc_info['dong'] , basedate )
            dataList = ( val, )        
            weather.insertWeather(cnx, insertQuery, updateQuery, checkQuery, keyList, dataList )            
        
            basedate = weather.datetimeAddHour(baseDatetime, hour + 1)
            keyList = (loc_info['do'], loc_info['gu'] , loc_info['dong'] , basedate )
            weather.insertWeather(cnx, insertQuery, updateQuery, checkQuery, keyList, dataList ) 

            basedate = weather.datetimeAddHour(baseDatetime, hour + 2)
            keyList = (loc_info['do'], loc_info['gu'] , loc_info['dong'] , basedate )
            weather.insertWeather(cnx, insertQuery, updateQuery, checkQuery, keyList, dataList )                     

def main():
    base_time = weather.getNowFormat( '%Y%m%d06' )

    error_count = 0
    try:
        cnx = mysql.connector.connect(**weather.DB_CONFIG)
        getAirpollutionLifeList(cnx, base_time )
      
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
    print ("getAirpollutionLifeList.py, Run Time: %d sec" %(t2-t1) )