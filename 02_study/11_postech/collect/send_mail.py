#!/usr/bin/python
#-*- coding: utf-8 -*-


import os, smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.MIMEText import MIMEText
from email import Encoders

import time
import datetime
import sys
from cStringIO import StringIO

DAUM_ID = 'braveji'
DAUM_PW = 'xodnstkfkd00'
DAUM_MAIL = 'braveji@daum.net'
RECV_MAILS = 'ygji@goodmit.co.kr'
CC_USERS = ['cmg306@postech.ac.kr', 'ygji49@gmail.com', 'braveji18@gmail.com', 'je5719@postech.ac.kr' ] # 여기에 추가

    
def sendMail(errorTitle, errorLogFile) :
    server = smtplib.SMTP_SSL('smtp.daum.net', 465)
    #server.set_debuglevel(1)
    server.ehlo()
    server.login(DAUM_ID, DAUM_PW)
    me = DAUM_MAIL     # 보내는 사람 메일 주소
    you = RECV_MAILS  # 받는 사람 메일 주소
    cc_users = CC_USERS # 같은 받는 사람 메일 주소

    errorLog = StringIO()
    with open( errorLogFile, 'r' ) as f :
        for line in f:
            errorLog.write( line )
            errorLog.write( '\n'  )

    contents = '[에너지빅데이터센터]\n%s\n\n%s' %( errorTitle , errorLog.getvalue() )
    errorLog.close()

    msg = MIMEText(contents, _charset='euc-kr')
    msg['Subject'] = '[EnergyBigDataCenter] ALERT Mail'
    msg['From'] = me
    msg['To'] = you   
    msg["Cc"] = ", ".join(cc_users)    
    
    server.sendmail(me, CC_USERS , msg.as_string())
    server.quit()    

    
def main():
    argLen = len( sys.argv )
    if len( sys.argv ) < 2  : 
        print "================================================================="
        print "USAGE   : python send_mail.py   "
        print "example : python send_mail.py   "
        print "your input command : " + str( sys.argv )
        print "================================================================="
        exit (-1);

    errorTitle = sys.argv[1]
    errorLogFile = sys.argv[2]

    sendMail(errorTitle, errorLogFile )

if __name__ == "__main__":
    main()

