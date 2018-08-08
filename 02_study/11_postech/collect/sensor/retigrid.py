#!/usr/bin/python
#-*- coding: utf-8 -*-

import urllib2 , urllib
import json
import pprint
from cStringIO import StringIO
import datetime, time
import platform
import sys

RETI_GRID_URL = "http://192.168.1.174:17668/retrieval/data/getData.json"
WAVE_FORM_LIST = ['IN' ,'VN' ,'IR' ,'VR' ,'IS' ,'VS' ,'IT' ,'VT' ]
MAX_SECONDS = 60 * 60  # 1hour 

INPUT_DATETIME_FORMAT = '%Y-%m-%dT%H:%M:%S'
SEPARATOR = '|'

def getUTCTime(ltime):
    UTC_OFFSET_TIMEDELTA = datetime.datetime.utcnow() - datetime.datetime.now()
    local_datetime = datetime.datetime.strptime(ltime, INPUT_DATETIME_FORMAT)
    result_utc_datetime = local_datetime + UTC_OFFSET_TIMEDELTA
    return result_utc_datetime.strftime("%Y-%m-%dT%H:%M:%S")


def getLocalTime(ltime):
    UTC_OFFSET_TIMEDELTA = datetime.datetime.now() - datetime.datetime.utcnow()
    local_datetime = datetime.datetime.strptime(ltime, '%Y-%m-%dT%H:%M:%S' )
    result_utc_datetime = local_datetime + UTC_OFFSET_TIMEDELTA
    return result_utc_datetime.strftime("%Y-%m-%d %H:%M:%S")
    
def getTimestamp( longtime  ) :
    return datetime.datetime.utcfromtimestamp( longtime ).strftime( '%Y-%m-%dT%H:%M:%S'  )


def getNowFormat( dateformat='%Y-%m-%d %H:%M:%S', prevHour=0 ) :
    today = datetime.datetime.now()
    if prevHour != 0 : 
        today = today - datetime.timedelta(hours=prevHour)
    return today.strftime( dateformat )

def checkMaxPeriod(fromDt, toDt, maxSeconds ) :
    fromDate = datetime.datetime.strptime(fromDt, INPUT_DATETIME_FORMAT)
    toDate = datetime.datetime.strptime(toDt, INPUT_DATETIME_FORMAT ) + datetime.timedelta(seconds=-maxSeconds)              
    return ( fromDate >= toDate )

def getReti(sensorName, fromDt, toDt, f ) : 

    for waveform in WAVE_FORM_LIST : 
        params = {
          "pv": "%s:%s" % ( sensorName , waveform ),
          "from":fromDt,
          "to":toDt
        }
        url_params = urllib.urlencode(params)
        
        retrieve_url = "%s?pv=%s:%s&from=%s&to=%s" % (RETI_GRID_URL , sensorName , waveform, fromDt, toDt )
        print retrieve_url

        req = urllib2.urlopen( retrieve_url ) 
        
        line = StringIO()
        data = json.load(req)
        totalLen = len( data )
        for idx in range( totalLen ) : 
            sname = data[idx]['meta']['name']
            sdata = data[idx]['data']
            dataLen = len( sdata )
            print "%s %d " %(sname , dataLen  )
            line = StringIO()
            for n in range( dataLen ) : 
                secs = sdata[n]['secs'] + 1
                nanos = str( sdata[n]['nanos'] )
                val = str( sdata[n]['val'] ) 
                #print "secs=%d,  nanos=%s, val=%s" %(secs , nanos , val[0:100] )
                val = val[1:len(val)-1]  # 양쪽의 [ ] 문자열 제거 
                secsformat = getLocalTime( getTimestamp( secs )  ) + "." + nanos[0:6]
                line.write( sensorName )
                line.write( SEPARATOR  )
                line.write( waveform )
                line.write( SEPARATOR  )                
                line.write( secsformat )                
                #line.write( SEPARATOR  )
                #line.write( nanos )
                line.write( SEPARATOR  )  
                line.write( val )
                line.write( '\n' )
                
            f.write( line.getvalue() )
            line.close() 

        f.flush()               
    
    
def main():

    print "your input command : " + str( sys.argv )

    argLen = len( sys.argv )
    if len( sys.argv ) < 5  : 
        print "================================================================="
        print "USAGE   : python retigrid.py  SAVE_DIR  sensorname   from   to "
        print "example : python retigrid.py  /home/admin/collect/sensor/data_reti  LI01H:PE-1A-N:RE-HS1   '2017-10-26T11:00:00'   '2017-10-26T11:01:00' "
        print "your input command : " + str( sys.argv )
        print "================================================================="
        exit (-1);

    save_dir = sys.argv[1]
    sensorName = sys.argv[2]
    fromDt = sys.argv[3]
    toDt = sys.argv[4]

    fromDt = getUTCTime(fromDt)
    toDt = getUTCTime(toDt)

    fromDt =  fromDt + ".000Z" 
    toDt =  toDt + ".000Z"        

    error_count = 0
    try:
        fileSensorData = '%s/%s_%s.txt' % (save_dir, sensorName.replace(':', '-') ,  getNowFormat( '%Y%m%d%H%M' ) )
        with open(fileSensorData, 'w') as f: 
            getReti( sensorName, fromDt, toDt, f )
    
    except Exception as e:
        error_count = 1
        print "ERROR :" , str( e )
        
    if error_count > 0 :
        exit (-1)

if __name__ == "__main__":
    import time
    t1 = time.time() # start time
    main()
    t2 = time.time() # end time
    print ("retigrid.py, Run Time: %d sec" %(t2-t1) )