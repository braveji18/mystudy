#!/usr/bin/python
#-*- coding: utf-8 -*-


import urllib2 , urllib
import json 
import pprint
from cStringIO import StringIO
import datetime, time
import platform
import mysql.connector
from mysql.connector.errors import Error
from mysql.connector import errorcode
import re
from pandas import Series, DataFrame
import pandas as pd


AUTH_KEY = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiI3MyIsImNsaWVudElkIjoiaGFkb29wQ2xpZW50IiwiaWF0IjoxNTA2MzIwOTg1LCJleHAiOjE1MTQwOTY5ODV9.JjNSi_NeF7HUYVLk6pSdN3DUBLirJebC_k1GbRqH-Ac'

DATA_THINGS_URL = 'https://api.sandbox.thingplus.net/v2'

SEPARATOR = ','

INPUT_DATETIME_FORMAT = '%Y-%m-%dT%H:%M:%S'

WORK_DIR = '/home/admin/collect/sensor'
    

with open('/home/admin/collect/db_config.json', 'r') as f: 
    DB_CONFIG = json.loads( f.read() )

def getTimestamp( longtime  ) :
    return datetime.datetime.utcfromtimestamp( longtime ).strftime( INPUT_DATETIME_FORMAT )
    
def getLocalTime(ltime):
    UTC_OFFSET_TIMEDELTA = datetime.datetime.now() - datetime.datetime.utcnow()
    local_datetime = datetime.datetime.strptime(ltime, INPUT_DATETIME_FORMAT)
    result_utc_datetime = local_datetime + UTC_OFFSET_TIMEDELTA
    return result_utc_datetime.strftime("%Y-%m-%d %H:%M:%S.000000")
    
def getUTCTime(ltime):
    UTC_OFFSET_TIMEDELTA = datetime.datetime.utcnow() - datetime.datetime.now()
    local_datetime = datetime.datetime.strptime(ltime, INPUT_DATETIME_FORMAT)
    result_utc_datetime = local_datetime + UTC_OFFSET_TIMEDELTA
    return result_utc_datetime.strftime("%Y-%m-%dT%H:%M:%S")
    
def getSensorTypeSiteID( cnx ) : 
    cursor = cnx.cursor()
    cursor.execute('select distinct thingsplus_site_id from SENSOR_TYPE WHERE thingsplus_site_id != \'\'  ')
    siteids = [ ]
    for (thingsplus_site_id ) in cursor:
       siteids.append( thingsplus_site_id[0] )
    cursor.close()    
    return siteids

def getSensorTypeModelInfo( cnx ) :
    cursor = cnx.cursor()
    cursor.execute('select measure_item_code, item_order, thingsplus_site_id, thingsplus_model_id, thingsplus_sensor_id from SENSOR_TYPE WHERE thingsplus_site_id != \'\'   order by thingsplus_site_id, item_order ')
    modelInfoDic = {}
    prev_site_id = ''
    for (measure_item_code, item_order, site_id, model_id, sensor_id ) in cursor:
        #print (measure_item_code, item_order, site_id, model_id, sensor_id )
        info = { 'measure_item_code': measure_item_code, 
                 'item_order':item_order, 
                 'site_id':site_id, 
                 'model_id':model_id,
                 'sensor_id':sensor_id  }
        
        if prev_site_id != site_id :
            infoList = [ info ]
            modelInfoDic[ site_id ] = infoList
        else : 
            infoList = modelInfoDic[ site_id ]
            infoList.append( info )
        
        prev_site_id = site_id
       
    cursor.close()
    return modelInfoDic

def getNowFormat( dateformat='%Y-%m-%d %H:%M:%S', prevHour=0 ) :
    today = datetime.datetime.now()
    if prevHour != 0 : 
        today = today - datetime.timedelta(hours=prevHour)
    return today.strftime( dateformat )


def getTimeDataFormat( utime, dateformat='%Y-%m-%d %H:%M:%S'  ) :
    ts = (float) ( utime / 1000 )
    return datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S.%f')


## Gateway( => Sensor ) 조회
def getSensorList( siteids ) : 

    retrive_url = '%s/gateways' % ( DATA_THINGS_URL ) 
    req = urllib2.Request(retrive_url)
    req.add_header('Authorization', AUTH_KEY)
    resp = urllib2.urlopen(req)

    data = json.load(resp)
    ##pprint.pprint ( data )

    sensorDic = {} 
    totalCount = data['_meta']['count']
    for idx in range( totalCount ) :
        sid = data['data'][idx]['id']
        sname = data['data'][idx]['name']
        model = data['data'][idx]['model']
        if model in siteids : 
            sensorDic[ sid ] = { 'sensorName': sname, 'model':model }
            print "allow SENSOR_ID=%s, SENSOR_NAME=%s, MODEL=%s" %( sid, sname, model )
        #else :
        #    print "not allow SENSOR_ID=%s, SENSOR_NAME=%s, MODEL=%s" %( sid, sname, model )

    return sensorDic
    
def getModelName( deviceId, deviceModels ) :

    # deviceid와 model명이 같이 있을때 
    for deviceModel in deviceModels :
        if 'id' in deviceModel.keys() :         
            if deviceModel['id'] == deviceId : 
                return deviceModel['model']
    
    # model명이 하나만 있을때
    for deviceModel in deviceModels :
        return deviceModel['model']

def getTimeStampFromThingsPlusData( series_data ) :
    dt_list = []
    #series_data = series['data']
    series_data_len = len( series_data )
    for idx in range( series_data_len ) :
        if idx % 2 == 1 : 
            localtime = getLocalTime( getTimestamp( series_data[idx]  / 1000 )  ) 
            dt_list.append( localtime )
            
    return dt_list
    
def getValueFromThingsPlusData( series_data ) :
    val_list = []
    #series_data = series['data']
    series_data_len = len( series_data )
    for idx in range( series_data_len ) :
        if idx % 2 == 0 : 
            val_list.append( series_data[idx] )
            
    return val_list
        
## SensorData 조회
def getSensorDataFromModel(modelInfo, sensorID, startDate, endDate, f) :
    retrive_url = '%s/gateways/%s?embed=sensors&sensors[embed]=series&sensors[series][dataStart]=%s.000Z&sensors[series][dataEnd]=%s.000Z&sensors[series][interval]=0' \
                   %( DATA_THINGS_URL,  sensorID, startDate, endDate )
     
    print retrive_url
    req = urllib2.Request(retrive_url)
    req.add_header('Authorization', AUTH_KEY)
    resp = urllib2.urlopen(req)

    data = json.load(resp)
    #print ( data )

    sname = data['data']['name']
    sensors = data['data']['sensors']
    deviceModels = data['data']['deviceModels']
    devices = data['data']['devices']
    
    error_count = 0;
    
    sensorDataDic = {} 
    dt_list = [] # list 
    totalCount = len( sensors )
    data_len = 0
    for idx in range( totalCount ) :
        deviceId = sensors[idx]['deviceId']
        modelName = getModelName( deviceId, deviceModels )
        model = sensors[idx]['model']
        if 'sequence' in sensors[idx].keys() : 
            sequence = sensors[idx]['sequence']
        else :
            sequence = ''
        dataStart = sensors[idx]['series']['_meta']['dataStart']
        dataEnd = sensors[idx]['series']['_meta']['dataEnd']

        series = sensors[idx]
        if sensors[idx]['series'] == None :
            error_count = 1 + error_count
            print "ERROR : has not Data ,  not exist series " 
            return error_count
        
        data_len = sensors[idx]['series']['_meta']['count']      
        #print (modelName, deviceId, model, sequence, dataStart, dataEnd, data_len )        
        dataKey = '%s:%s:%s:%s' %( modelName, deviceId, model, sequence )
        sensorDataDic[ dataKey ] = series

        dataKey = '%s:%s:%s' %( modelName, deviceId, 'DT' )
        if not dataKey in sensorDataDic : 
            dt_list = getTimeStampFromThingsPlusData( series['series']['data']  )
            sensorDataDic[ dataKey ] = dt_list

    infoLen = len( modelInfo )
    dataFrameDic = {}
    for idx in range( infoLen ) : 
        model_id = modelInfo[ idx ]['model_id']
        sensor_id = modelInfo[ idx ]['sensor_id']
        model = ''
        sequence = ''
        for sensor in sensor_id.split('\n') : 
            if "model:" in sensor  :
                model = sensor.split(':')[1]
            if "sequence:" in sensor  :
                sequence = sensor.split(':')[1]                
        
        #print "sensor_id=%s, model=%s, sequence=%s" %(sensor_id, model, sequence) 
        
        for devicemodel in devices : 
            #print "devicemodel=%s" %(devicemodel)
            dicKey = '%s_%s' % (model_id, devicemodel)
            newDataDic = {}
            if dicKey in dataFrameDic: 
                newDataDic = dataFrameDic[ dicKey ]
            else :
                dataFrameDic[ dicKey ] = newDataDic
            
            if 'DT' == sensor_id :
                dataKey = '%s:%s:%s' %( model_id, devicemodel, sensor_id )
                newDataDic[ sensor_id ] = { "timestamp" : sensorDataDic[ dataKey ], "DT" :  sensorDataDic[ dataKey ] }
            elif sensor_id.find("attribute:") > -1 :
                attribute = sensor_id.split(":")[1]
                dataKey = '%s:%s' %( model_id, devicemodel )
                for key in sensorDataDic.keys() : 
                    if  not ':DT' in key  and  key.find( dataKey ) > -1 : 
                        series = sensorDataDic[ key ]
                        attrVal = series[ attribute ]
                        dataList = []
                        data_len = len( series['series']['data'] ) / 2 
                        for n in range( data_len ) : 
                            dataList.append( attrVal )
                        newDataDic[ sensor_id ] = { "timestamp" : getTimeStampFromThingsPlusData( series['series']['data'] ), sensor_id : dataList }
            else :
                dataKey = '%s:%s:%s:%s' %( model_id, devicemodel, model, sequence )
                series = sensorDataDic[ dataKey ]
                newDataDic[ sensor_id ] = { "timestamp" : getTimeStampFromThingsPlusData( series['series']['data'] ), sensor_id : getValueFromThingsPlusData( series['series']['data'] ) }
                     
    dataFrameList = []
    for dataFrameKey in dataFrameDic.keys() : 
        dataDic = dataFrameDic[ dataFrameKey ]
        
        prevDataFrame = None
        for dataKey in dataDic.keys() :
            data = dataDic[ dataKey ]
            #print data 
            currentDataFrame = DataFrame( data )  
            del data 
            if prevDataFrame is None:
                prevDataFrame = currentDataFrame
            else :                 
                newDataFrame = pd.merge(prevDataFrame, currentDataFrame, on='timestamp', how='outer') 
                del prevDataFrame
                del currentDataFrame
                prevDataFrame = newDataFrame

        dataFrameList.append( prevDataFrame )
        del dataDic
        

    for dataframe in dataFrameList:
        dataframe = dataframe.fillna('')     
        line = StringIO()
        for row_index, row in dataframe.iterrows():
            if row['DT'] == '' : 
                continue
        
            for idx in range( infoLen ) :
                sensor_id = modelInfo[ idx ]['sensor_id']
                #print  modelInfo[ idx ]['item_order']
                #print sensor_id
                line.write( str( row[ sensor_id ] ) ) 
                line.write( SEPARATOR ) 
            
            line.write( '\n' ) 
        #print line.getvalue()
        f.write( line.getvalue() )
        line.close() 
        
    f.flush()
    return error_count

def main():

    #startDate = getNowFormat( '%Y-%m-%dT00:00:00', prevHour=24 )
    #endDate = getNowFormat( '%Y-%m-%dT23:59:59', prevHour=24 )
    
    startDate = getNowFormat( '%Y-%m-%dT00:00:00' )
    endDate = getNowFormat( '%Y-%m-%dT23:59:59' )
    
    #startDate = '2017-11-13T00:00:00'
    #endDate = '2017-11-13T23:59:59'
    
    yyyymmdd = startDate.replace('-', '')[0:8]    
    startDate = getUTCTime(startDate)
    endDate = getUTCTime(endDate)
    error_count = 0
    
    try:
        cnx = mysql.connector.connect(**DB_CONFIG)
        siteids = getSensorTypeSiteID( cnx  )
        sensorDic = getSensorList( siteids ) 

        modelInfoDic = getSensorTypeModelInfo(cnx)
        #print modelInfoDic

        for sensorID in sensorDic.keys() :
            sensorName = sensorDic[ sensorID ]['sensorName']
            sensorName = sensorName.replace(':', '#')
            modelID = sensorDic[ sensorID ]['model']
            modelInfo = modelInfoDic[ modelID ] 
            #print (sensorName, modelID )
            fileSensorData = '%s/data/%s_%s.csv' % (WORK_DIR, sensorName , yyyymmdd  )
            with open(fileSensorData, 'w') as f:
                getSensorDataFromModel(modelInfo, sensorID, startDate, endDate, f )

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
    print ("thingsplus.py, Run Time: %d sec" %(t2-t1) )


