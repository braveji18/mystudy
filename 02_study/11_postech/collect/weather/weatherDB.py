#!/usr/bin/python
#-*- coding: utf-8 -*-

from __future__ import print_function
from datetime import date, datetime, timedelta
import mysql.connector

DB_CONFIG = {
  'user': 'energy',
  'password': 'vhtmxpr1!',
  'host': 'mgmt001.data.postech',
  'database': 'energy',
  'raise_on_warnings': True,
}

#cnx = mysql.connector.connect(**dbconfig)
#cursor = cnx.cursor()
#query = ("SELECT code_type, type_name FROM CODE_TYPE ")
#cursor.execute(query)
#
#for (code_type, type_name) in cursor:
#  print("%s, %s" %( code_type, type_name ) )
#
#cursor.close()
#cnx.close()

def insertWeather(cnx, insertSQL, dataJson ) :
    add_weather = ("INSERT INTO WEATHER " \
              "( area_do,area_gu,area_dong,reg_date,T1H,RN1,SKY,UUU,VVV,REH,PTY,LGT,VEC,WSD,A01_2,A07,A03,A05,A06,A08,A09 ) " \
              "VALUES ( %(area_do)s, %(area_gu)s, %(area_dong)s, %(reg_date)s, %(T1H)s, %(RN1)s,%(SKY)s,%(UUU)s,%(VVV)s,%(REH)s,%(PTY)s,%(LGT)s,%(VEC)s,%(WSD)s,%(A01_2)s,%(A07)s,%(A03)s,%(A05)s,%(A06)s,%(A08)s,%(A09)s  ) ")
    cnx = mysql.connector.connect(**DB_CONFIG)
    cursor = cnx.cursor()
    cursor.execute(insertSQL, dataJson)
    cnx.commit()
    cursor.close()

