#!/bin/sh

WORK_DIR=/home/admin/collect/weather

MONTH=$(date +"%m")
HOUR=$(date +"%H")
#HOUR=07

echo "MONTH=$MONTH, HOUR=$HOUR"

cd $WORK_DIR

IS_OK=0

# 동네예보정보조회
python  $WORK_DIR/forecastgrib.py
if [ $? -ne 0 ]; then
    # python 에러 발생
    IS_OK=1
fi

# 식중독지수
if [[ "03 04 05 06 07 08 09 10 11" == *"${MONTH}"*  && "07" == *"${HOUR}"*  ]]  ;then 
   echo "not run getFsnLifeList.py" 
   python  $WORK_DIR/getFsnLifeList.py
   if [ $? -ne 0 ]; then
      # python 에러 발생
      IS_OK=1
   fi
else    
   echo "not run getFsnLifeList.py" 
fi    


# 체감온도
if [[ "11 12 01 02 03" == *"${MONTH}"*  && "07" == *"${HOUR}"*  ]]  ;then 
   echo "run getSensorytemLifeList.py" 
   python  $WORK_DIR/getSensorytemLifeList.py
   if [ $? -ne 0 ]; then
      # python 에러 발생
      IS_OK=1
   fi
else    
   echo "not run getSensorytemLifeList.py" 
fi


# 열지수
if [[ "06 07 08 09" == *"${MONTH}"*  && "07" == *"${HOUR}"*  ]]  ;then 
   echo "run getHeatLifeList.py" 
   python  $WORK_DIR/getHeatLifeList.py
   if [ $? -ne 0 ]; then
      # python 에러 발생
      IS_OK=1
   fi   
else    
   echo "not run getHeatLifeList.py" 
fi


# 불쾌지수
if [[ "06 07 08 09" == *"${MONTH}"*  && "07" == *"${HOUR}"*  ]]  ;then 
   echo "run getDspIsLifeList.py" 
   python  $WORK_DIR/getDspIsLifeList.py
   if [ $? -ne 0 ]; then
      # python 에러 발생
      IS_OK=1
   fi
else    
   echo "not run getDspIsLifeList.py" 
fi   

#자외선지수
if [[ "03 04 05 06 07 08 09 10 11" == *"${MONTH}"*  && "07" == *"${HOUR}"*  ]]  ;then 
   echo "not run getUltrvLifeList.py" 
   python  $WORK_DIR/getUltrvLifeList.py
   if [ $? -ne 0 ]; then
      # python 에러 발생
      IS_OK=1
   fi   
else    
   echo "not run getUltrvLifeList.py" 
fi

#동파가능지수
if [[ "12 01 02" == *"${MONTH}"*  && "07" == *"${HOUR}"*  ]]  ;then 
   echo "run getWinterLifeList.py" 
   python  $WORK_DIR/getWinterLifeList.py
   if [ $? -ne 0 ]; then
      # python 에러 발생
      IS_OK=1
   fi
else    
   echo "not run getWinterLifeList.py" 
fi


# 대기오염확산지수
if [[ "11 12 01 02 03 04 05" == *"${MONTH}"*  && "07" == *"${HOUR}"*  ]]  ;then 
   echo "run getAirpollutionLifeList.py" 
   python  $WORK_DIR/getAirpollutionLifeList.py
   if [ $? -ne 0 ]; then
      # python 에러 발생
      IS_OK=1
   fi
else    
   echo "not run getAirpollutionLifeList.py" 
fi

if [[  "07" == *"${HOUR}"*  ]]  ;then 
    $WORK_DIR/sqoop_import_table.sh
fi


if [ $IS_OK -ne 0 ]; then
    rm -f ${WORK_DIR}/_SUCCESS_WEATHER
    exit -1        
else 
    echo "" > ${WORK_DIR}/_SUCCESS_WEATHER
    exit 0
fi

