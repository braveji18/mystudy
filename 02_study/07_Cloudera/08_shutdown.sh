#!/bin/sh

###############################
# CM Agent shutdown 
###############################
pssh -h /root/allnodes "systemctl stop cloudera-scm-agent"

###############################
# CM server shutdown 
###############################
systemctl stop cloudera-scm-server

###############################
# DB shutdown 
###############################
systemctl stop mariadb

###############################
# Nodes shutdown 
###############################
pssh -h /root/nodes_exclude_me "shutdown -h now"

###############################
# Current Nodes shutdown 
###############################
sleep 1

shutdown -h now

