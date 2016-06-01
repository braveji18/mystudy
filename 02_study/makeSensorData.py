#!/usr/bin/python
#-*- coding: utf-8 -*-

## 랜덤한 센서 데이터 생성
## 파일명 : makeSensorData.py
import numpy 
import datetime


startStr = "2015-04-15 00:00:00"
sec = 1
N = 100000
outputFile = 'output.txt'

sensor01 = {'code':'1', 'desc': 'Temerature' ,'mu':1100, 'sigma': 50, 'distribute' : numpy.random.normal }
sensor02 = {'code':'2', 'desc': 'Humidity'   ,'mu':62,   'sigma': 5,  'distribute' : numpy.random.normal }
sensor03 = {'code':'3', 'desc': 'Speed'      ,'mu':225,  'sigma': 0,  'distribute' : numpy.random.poisson }
sensor04 = {'code':'4', 'desc': 'Vibration'  ,'mu':550,  'sigma': 10, 'distribute' : numpy.random.normal }
sensor05 = {'code':'5', 'desc': 'Pressure'   ,'mu':300,  'sigma': 400,'distribute' : numpy.random.uniform }
sensor06 = {'code':'6', 'desc': 'Noise'      ,'mu':65,   'sigma': 10, 'distribute' : numpy.random.poisson }
allSensor = list()
allSensor.append( sensor01 ) 
allSensor.append( sensor02 ) 
allSensor.append( sensor03 ) 
allSensor.append( sensor04 ) 
allSensor.append( sensor05 ) 
allSensor.append( sensor06 ) 

MAX_NUM_PER_FUN = 10000

nextDatetime = datetime.datetime.strptime(startStr, '%Y-%m-%d %H:%M:%S')

def randomDistribute( mean, sigma, size, distributeFun ) :
    """
    여러가지 분포에 따라서 인자 설정을 다르게 설정하도록 하는 함수
    """
    
    if "poisson" == distributeFun.__name__ : 
        return distributeFun( mean, size )
    else :
        return distributeFun( mean, sigma, size )

    
def makeSensorData( SensorList, currDateTime, sec, N ) :
    """ 여러가지 센서 정보를 인자로 받고 특정시점부터 데이터를 N개 생성하는 함수 정의
    SensorList : 센서 정보를 갖는 List, 센서 정보를 dictionary형식으로 정의함.
    currDateTime : 특정시점 
    sec : 시간 간격(초)
    N : 생성할 데이터의 개수
    """
    from cStringIO import StringIO
    strIO = StringIO()
    
    codeList = list()
    randNumList = list()
    for sensor in SensorList :
        codeList.append( sensor['code'] )
        rnum = randomDistribute( 
            sensor['mu'], 
            sensor['sigma'], 
            N, 
            sensor['distribute']  ) 
        randNumList.append( rnum )

    for i in range( N ) :
        dateStr = currDateTime.strftime('%Y-%m-%d')
        timeStr = currDateTime.strftime('%H:%M:%S')
        for idx in range( len(codeList) ) : 
            strIO.write( "%s,%s,%s,%d\n" %( dateStr, timeStr, codeList[idx], randNumList[idx][i] )  )
            
        currDateTime = currDateTime + datetime.timedelta(seconds=sec)        
    return strIO.getvalue()

def main(): 
    with open(outputFile, 'w') as f:
        for i in range(  N / MAX_NUM_PER_FUN ) :
            n = MAX_NUM_PER_FUN
            if i == N / MAX_NUM_PER_FUN : 
                n = N % MAX_NUM_PER_FUN
            data = makeSensorData( allSensor, nextDatetime, sec, n)
            f.write( data )
            f.flush()
            
if __name__ == "__main__":
    import time
    t1 = time.time() # start time
    main()
    t2 = time.time() # end time
    print ("makeSensorData.py, Run Time: %dsec" %(t2-t1) )