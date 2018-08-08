#!/usr/bin/python
#-*- coding: utf-8 -*-

import mysql.connector
from mysql.connector.errors import Error
from mysql.connector import errorcode
import urllib2 , urllib
import json
import pprint
from cStringIO import StringIO
import datetime, time
import platform
import sys, os
from os.path import basename
from dateutil import tz

WORK_DIR = '/home/admin/collect/sensor/data_encored/working'

INPUT_DATETIME_FORMAT = '%Y-%m-%d %H:%M:%S'

with open('/home/admin/collect/db_config.json', 'r') as f: 
    DB_CONFIG = json.loads( f.read() )  
   
def getTimestamp( longtime  ) :
    return datetime.datetime.utcfromtimestamp( longtime ).strftime( INPUT_DATETIME_FORMAT )
    
def getLocalTime(ltime):
    UTC_OFFSET_TIMEDELTA = datetime.datetime.now() - datetime.datetime.utcnow()
    local_datetime = datetime.datetime.strptime(ltime, INPUT_DATETIME_FORMAT)
    result_utc_datetime = local_datetime + UTC_OFFSET_TIMEDELTA
    return result_utc_datetime.strftime("%Y-%m-%d %H:%M:%S")
    
def getDeivceName( cnx, device_id ) : 
    cursor = cnx.cursor()
    cursor.execute('select device_name from DEVICE WHERE device_hash = %s   order by  change_date  desc limit 1 ',  ( str(device_id), )   )
    row = cursor.fetchone()
    cursor.close()
    if row == None:
        return ''
    else : 
        return row[0]
    
def convert_format(device_id, device_name, yyyymmdd, f ) :
    cnt = 0
    is_first = False
    sensor_dic = { }
    PHASE = 'RST'
    for line in f:
        rows = line.split(',')
        row_cnt = len( rows )
        timestamp = long( rows[0] )
        localtime = getLocalTime( getTimestamp(timestamp / 1000 )  )
        site_id = rows[1]
        device_id = rows[2]
        device_hash = rows[3]
        device_sn = rows[4]
        channel_cnt = int( rows[5] )
        #print (row_cnt, timestamp, site_id,device_id,device_sn, channel_cnt )
        
        if False == is_first :
            if 1 == channel_cnt :
                sensor_name = "%s" %( device_name  )
                sensor_name = sensor_name.replace(':', '_')
                #print  sensor_name
                sensor_dic[ sensor_name ] = StringIO()


            for idx in range( channel_cnt - 1 ) :
                sensor_name = "%s:%d.%s" %( device_name, (idx+1), PHASE[ idx % 3 ]  )
                sensor_name = sensor_name.replace(':', '_')
                #print  sensor_name 
                sensor_dic[ sensor_name ] = StringIO()
            is_first = True
       
        if  1 == channel_cnt :
            channel_id     = rows[6 ]
            vrm            = rows[7 ]
            lms            = rows[8 ]
            active_power   = rows[9 ]
            reactive_power = rows[10 ]
            reactive_power = reactive_power.replace( '\n', '')

            phase = PHASE[ 0 ]
            sensor_name = "%s" %( device_name )
            sensor_name = sensor_name.replace(':', '_')
            sensor_date = "%s.000000,%s,%s,%s,%s,%s\n" %( localtime, phase,vrm, lms, active_power, reactive_power  )
            #print (sensor_name, sensor_date)
            sensor_dic[ sensor_name ].write( sensor_date )
 
        for offset in range( 1, channel_cnt ):
            channel_id     = rows[6 + 5 * offset  ]
            vrm            = rows[7 + 5 * offset  ]
            lms            = rows[8 + 5 * offset  ]
            active_power   = rows[9 + 5 * offset  ]
            reactive_power = rows[10 + 5 * offset  ]
            reactive_power = reactive_power.replace( '\n', '')

            phase = PHASE[ (offset-1) % 3 ]
            sensor_name = "%s:%d.%s" %( device_name, (offset), phase ) 
            sensor_name = sensor_name.replace(':', '_')
            sensor_date = "%s.000000,%s,%s,%s,%s,%s\n" %( localtime, phase,vrm, lms, active_power, reactive_power  ) 
            #print (sensor_name, sensor_date)
            sensor_dic[ sensor_name ].write( sensor_date )
        
        
        #if cnt > 10  :
        #     break
        
        cnt += 1
        
    for sensor_name in sensor_dic: 
        buf = sensor_dic[ sensor_name ]
        w_file = "%s/%s_%s.csv" %(WORK_DIR, sensor_name, yyyymmdd)         
        with open(w_file , 'w' ) as fw :
            fw.write( buf.getvalue() )
            fw.flush()
        buf.close()
        
    
def main(): 
    #argLen = len( sys.argv )
    #if len( sys.argv ) < 2  : 
    #    print "================================================================="
    #    print "USAGE   : python encored.py  encored_sensor_data  working_directory"
    #    print "example : python encored.py  /home/admin/collect/sensor/data_encored/10045721_51651_20171110.csv  "
    #    print "your input command : " + str( sys.argv )
    #    print "================================================================="
    #    exit (-1);

    encored_file = sys.argv[1]    
    #encored_file = '/home/admin/collect/sensor/data_encored/20171122/10045721_6b0ef73a_20171122.csv'    
    #encored_file = '/home/admin/collect/sensor/data_encored/10051222_6911d3c0_20171208.csv'

    error_count = 0
    try:
        cnx = mysql.connector.connect(**DB_CONFIG)
        file_name = basename( encored_file )
        file_name = os.path.splitext( file_name )       
        #print file_name 
        device_id = file_name[0].split('_')[1]
        yyyymmdd = file_name[0].split('_')[2]
        #print (device_id, yyyymmdd)        
        device_name = getDeivceName(cnx, device_id)
        if '' == device_name : 
            print("ERROR  not registered Device, " + encored_file )
            error_count = 1
        
        else : 
            file_size = os.path.getsize( encored_file )
            if  file_size > 0 : 
                with open(encored_file, 'r') as f: 
                    convert_format(device_id, device_name, yyyymmdd, f )
            else : 
                print("ERROR file size==0 , " + encored_file )
                error_count = 1
                
    except mysql.connector.Error as err:
        error_count = 1
        print("ERROR FILE : " + encored_file )
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
    print ("encored.py, Run Time: %d sec" %(t2-t1) )
