#!/usr/bin/python
#-*- coding: utf-8 -*-

import urllib2 
import json 
import pprint
from cStringIO import StringIO
import datetime, time
import mysql.connector
from mysql.connector.errors import Error
from mysql.connector import errorcode

with open('/home/admin/collect/db_config.json', 'r') as f: 
    DB_CONFIG = json.loads( f.read() )

LOCATION_INFOS = {
'경상북도 포항시 남구 구룡포읍':{'do':'경상북도','gu':'포항시남구','dong':'구룡포읍', 'x':'105', 'y':'94' ,'AreaNo':'4711125000'},
'경상북도 포항시 남구 연일읍':{'do':'경상북도','gu':'포항시남구','dong':'연일읍', 'x':'102', 'y':'94'    ,'AreaNo':'4711125300'},
'경상북도 포항시 남구 오천읍':{'do':'경상북도','gu':'포항시남구','dong':'오천읍', 'x':'103', 'y':'93'    ,'AreaNo':'4711125600'},
'경상북도 포항시 남구 대송면':{'do':'경상북도','gu':'포항시남구','dong':'대송면', 'x':'102', 'y':'93'    ,'AreaNo':'4711131000'},
'경상북도 포항시 남구 동해면':{'do':'경상북도','gu':'포항시남구','dong':'동해면', 'x':'104', 'y':'94'    ,'AreaNo':'4711132000'},
'경상북도 포항시 남구 장기면':{'do':'경상북도','gu':'포항시남구','dong':'장기면', 'x':'105', 'y':'92'    ,'AreaNo':'4711133000'},
'경상북도 포항시 남구 호미곶면':{'do':'경상북도','gu':'포항시남구','dong':'호미곶면', 'x':'106', 'y':'96' ,'AreaNo':'4711135000'},
'경상북도 포항시 남구 상대동':{'do':'경상북도','gu':'포항시남구','dong':'상대동', 'x':'102', 'y':'94'    ,'AreaNo':'4711152500'},
'경상북도 포항시 남구 해도동':{'do':'경상북도','gu':'포항시남구','dong':'해도동', 'x':'102', 'y':'94'    ,'AreaNo':'4711154500'},
'경상북도 포항시 남구 송도동':{'do':'경상북도','gu':'포항시남구','dong':'송도동', 'x':'102', 'y':'94'    ,'AreaNo':'4711155000'},
'경상북도 포항시 남구 청림동':{'do':'경상북도','gu':'포항시남구','dong':'청림동', 'x':'103', 'y':'94'    ,'AreaNo':'4711156000'},
'경상북도 포항시 남구 제철동':{'do':'경상북도','gu':'포항시남구','dong':'제철동', 'x':'103', 'y':'94'    ,'AreaNo':'4711157000'},
'경상북도 포항시 남구 효곡동':{'do':'경상북도','gu':'포항시남구','dong':'효곡동', 'x':'102', 'y':'94'    ,'AreaNo':'4711158000'},
'경상북도 포항시 남구 대이동':{'do':'경상북도','gu':'포항시남구','dong':'대이동', 'x':'102', 'y':'94'    ,'AreaNo':'4711159000'},
'경상북도 포항시 북구 흥해읍':{'do':'경상북도','gu':'포항시북구','dong':'흥해읍', 'x':'102', 'y':'96'    ,'AreaNo':'4711325000'},
'경상북도 포항시 북구 신광면':{'do':'경상북도','gu':'포항시북구','dong':'신광면', 'x':'100', 'y':'97'    ,'AreaNo':'4711331000'},
'경상북도 포항시 북구 청하면':{'do':'경상북도','gu':'포항시북구','dong':'청하면', 'x':'102', 'y':'98'    ,'AreaNo':'4711332000'},
'경상북도 포항시 북구 송라면':{'do':'경상북도','gu':'포항시북구','dong':'송라면', 'x':'102', 'y':'99'    ,'AreaNo':'4711333000'},
'경상북도 포항시 북구 기계면':{'do':'경상북도','gu':'포항시북구','dong':'기계면', 'x':'100', 'y':'95'    ,'AreaNo':'4711334000'},
'경상북도 포항시 북구 죽장면':{'do':'경상북도','gu':'포항시북구','dong':'죽장면', 'x':'97', 'y':'97'     ,'AreaNo':'4711335000'},
'경상북도 포항시 북구 기북면':{'do':'경상북도','gu':'포항시북구','dong':'기북면', 'x':'99', 'y':'96'     ,'AreaNo':'4711336000'},
'경상북도 포항시 북구 중앙동':{'do':'경상북도','gu':'포항시북구','dong':'중앙동', 'x':'102', 'y':'95'    ,'AreaNo':'4711352000'},
'경상북도 포항시 북구 양학동':{'do':'경상북도','gu':'포항시북구','dong':'양학동', 'x':'102', 'y':'94'    ,'AreaNo':'4711363000'},
'경상북도 포항시 북구 죽도동':{'do':'경상북도','gu':'포항시북구','dong':'죽도동', 'x':'102', 'y':'95'    ,'AreaNo':'4711365500'},
'경상북도 포항시 북구 용흥동':{'do':'경상북도','gu':'포항시북구','dong':'용흥동', 'x':'102', 'y':'95'    ,'AreaNo':'4711366500'},
'경상북도 포항시 북구 우창동':{'do':'경상북도','gu':'포항시북구','dong':'우창동', 'x':'102', 'y':'95'    ,'AreaNo':'4711368000'},
'경상북도 포항시 북구 두호동':{'do':'경상북도','gu':'포항시북구','dong':'두호동', 'x':'102', 'y':'95'    ,'AreaNo':'4711369000'},
'경상북도 포항시 북구 장량동':{'do':'경상북도','gu':'포항시북구','dong':'장량동', 'x':'102', 'y':'95'    ,'AreaNo':'4711370000'},
'경상북도 포항시 북구 환여동':{'do':'경상북도','gu':'포항시북구','dong':'환여동', 'x':'103', 'y':'95'    ,'AreaNo':'4711371000'},
}

DATA_GO_URL = 'http://newsky2.kma.go.kr'
SEVICE_LIST = { 
 '생활기상지수조회서비스' : "iros/RetrieveLifeIndexService2",
 '동네예보정보조회서비스' : "service/SecndSrtpdFrcstInfoService2"
}

DETAIL_FUNCTION  = { 
 '초단기실황조회' : 'ForecastGrib', 
 '초단기예보조회' : 'ForecastTimeData', 
 '동네예보조회' : 'ForecastSpaceData', 
 '예보버전조회' : 'ForecastVersionCheck',
 '식중독지수' : 'getFsnLifeList', 
 '체감온도' : 'getSensorytemLifeList', 
 '열지수' : 'getHeatLifeList', 
 '불쾌지수' : 'getDsplsLifeList', 
 '동파가능지수' : 'getWinterLifeList', 
 '자외선지수' : 'getUltrvLifeList', 
 '대기오염확산지수' : 'getAirpollutionLifeList'
}

CODE_INFO = {
 '초단기실황' : [ 'T1H', 'RN1', 'SKY', 'UUU', 'VVV', 'REH', 'PTY', 'LGT', 'VEC', 'WSD'], 
 '식중독지수':'A01_2' ,
 '자외선지수':'A07' ,
 '체감온도':'A03' ,
 '열지수':'A05' ,
 '불쾌지수':'A06' ,
 '동파가능지수':'A08' ,
 '대기오염확산지수':'A09' ,     
}

SERVICE_KEY = "2GiBhujMz%2BTjpU7DGW5S08PybBafZ3d1ROrBwFCMcfQ2FszNe0QUpSN3LVA%2F%2FpNAkSXInsyr68yj%2FIte8pP%2FWQ%3D%3D"
SEPARATOR = ','
INPUT_DATETIME_FORMAT = '%Y%m%d%H%M%S'

def insertWeather(cnx, insertQuery, updateQuery, checkQuery, keyList, dataList) :
    cursor = cnx.cursor()
    cursor.execute(checkQuery, keyList)
    for cnt in cursor:
        if cnt[0] > 0 : 
            dataVal = dataList + keyList
            #print "updateQuery : %s : %s"  %(updateQuery,   str( dataVal ) )
            cursor.execute(updateQuery,  dataVal ) 
        else :
            dataVal = keyList + dataList
            #print "insertQuery : %s : %s"  %(insertQuery,   str( dataVal ) )
            cursor.execute(insertQuery, dataVal  ) 

    cnx.commit()
    cursor.close()


def datetimeAddHour( current, h  ) :
    hour_later = current + datetime.timedelta(hours=h)
    retVal = hour_later.strftime(INPUT_DATETIME_FORMAT)
    return retVal
    
def getDateFormat( base_date  ) :
    myDatetime = datetime.datetime.strptime(base_date, '%Y%m%d')    
    return myDatetime.strftime('%Y-%m-%d')

def getTimeFormat( base_time  ) :
    myDatetime = datetime.datetime.strptime(base_time, '%H%M')    
    return myDatetime.strftime('%H:%M:%S.%f')

def getNowFormat( dateformat='%Y-%m-%d %H:%M:%S', prevHour=0 ) :
    today = datetime.datetime.now()
    if prevHour != 0 : 
        today = today - datetime.timedelta(hours=prevHour)
    return today.strftime( dateformat )

def print_dic( dic ) :
    for keys,values in dic.items():
        print( "%s : %s" %( keys, values ) )
