#!/usr/bin/python
#-*- coding: utf-8 -*-


import ftplib

path = 'pub/Health_Statistics/NCHS/nhanes/2001-2002/'
filename = 'L28POC_B.xpt'

ftp = ftplib.FTP("Server IP") 
ftp.login("UserName", "Password") 
ftp.cwd(path)
ftp.retrbinary("RETR " + filename, open(filename, 'wb').write)
ftp.quit()
