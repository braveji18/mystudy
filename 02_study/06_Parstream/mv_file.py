import os, sys, time
from stat import *
from time import gmtime, strftime

dir_path = '/disk1/data/test01'
import_path = '/disk1/data/tpch'


def mv_file() : 

    findlist = os.listdir(dir_path)
    current_time = time.time(); 
    for f in findlist:
        modify_time = os.stat( dir_path + "/" +  f).st_mtime
        #print time.strftime('%y.%m.%d %H:%M:%S', time.localtime(modify_time))
        diff_time = long( (current_time - modify_time )  )
        #print diff_time    
 
        if diff_time >= 5 : 
            print "move from " + dir_path + "/" + f + " to " +  import_path + '/' 
            os.rename( dir_path + "/" + f , import_path + '/' + f )


while( True ) :
    mv_file()
    time.sleep(2)
