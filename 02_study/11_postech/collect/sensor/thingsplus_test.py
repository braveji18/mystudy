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
    
siteids = ( 71 )
    
retrive_url = '%s/gateways' % ( DATA_THINGS_URL ) 
req = urllib2.Request(retrive_url)
req.add_header('Authorization', AUTH_KEY)
resp = urllib2.urlopen(req)
data = json.load(resp)
sensorDic = {} 
totalCount = data['_meta']['count']
for idx in range( totalCount ) :
    sid = data['data'][idx]['id']
    sname = data['data'][idx]['name']
    model = data['data'][idx]['model']
    if model == '71' : 
        sensorDic[ sid ] = { 'sensorName': sname, 'model':model }
        print "allow SENSOR_ID=%s, SENSOR_NAME=%s, MODEL=%s" %( sid, sname, model )


        
retrive_url = '%s/gateways/%s?embed=sensors&sensors[embed]=series&sensors[series][dataStart]=%s.000Z&sensors[series][dataEnd]=%s.000Z&sensors[series][interval]=0' \
                   %( DATA_THINGS_URL,  'encored_05cdaca3', '2017-11-31T00:00:00', '2017-11-31T00:00:00' )
     
print retrive_url
req = urllib2.Request(retrive_url)
req.add_header('Authorization', AUTH_KEY)
resp = urllib2.urlopen(req)

data = json.load(resp)
print ( data )
        