#!/bin/bash
clear
echo "The Report about the System's Swappiness, IP tables, name resolution and no. of cores in the system"
echo "___________________________________________________________________________________________________"
echo

if [ $# -eq 0 ]; then
	echo "Please enter a  IPaddress first followed by the hostname and try again" 
elif [ $# -eq 1 ]; then
	echo "Please enter a IP address first followed by the hostname and try again"
else
	if [ -f "/proc/sys/vm/swappiness" ]; then
		echo "The current swappiness of the system is " 
	cat /proc/sys/vm/swappiness
	else
		echo "The file swappiness is not found"
	fi
	echo
	echo "************************************************"
	echo	
	echo "The hostname for a given IP address"
	hostname=`dig -x $1 +short`
	if [ -z "${hostname-unset}" ]; then
    		echo "Hostname does not exists"

	else
		echo $hostname
	fi
	echo
	echo "************************************************"
	echo
	echo "The IP address for a given hostname is"
	host $2 | awk -F " address " '{print $2}'
	echo "************************************************"
	echo

	# Checking the status of the IP tables
	echo "The current status of the IP tables service is "
	service iptables status
	echo
	echo "************************************************"
	echo

	echo "To test if the Firewall software status (on/off)"
	/sbin/chkconfig --list iptables
	echo
	echo "Now for IPv6"
	/sbin/chkconfig --list ip6tables
	echo
	echo "************************************************"
	echo
	echo "The number of cores available in the system are " 
	cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l
	echo
fi
