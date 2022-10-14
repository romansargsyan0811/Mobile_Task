#!/bin/bash

ram_info() {
	echo -e "******************************RAM**********************************\n" 
	echo "Total: "  
	free -g | awk 'NR > 1 { print "["$1,  $2 "]"}'
	echo "Free: "         
	free -g | awk 'NR > 1 { print "["$1 ,  $4 "]"}'
}

cpu_info() {
	echo -e "******************************CPU**********************************\n"
	lscpu | grep Model
	lscpu | grep core
	lscpu | grep Core
	lscpu | grep MHz
}

disk_info() {
	echo -e "******************************DISKS********************************\n"
	df -h | grep File
	df -h | grep /dev/sd
}

usb_info() {
	echo -e "******************************USB**********************************\n"
	lsusb
}

gpu_info() {
	echo -e "******************************GPU**********************************\n"
	glxinfo | grep Device
	glxinfo | grep Video
}

motherboard_info() {
	echo -e "*************************MOTHERBOARD********************************\n"
	sudo dmidecode -t 2
}

os_info() {
	echo -e "******************************OS**********************************\n"
	cat /etc/os-release
}

help_info() {
	echo -e "******************************HELP**********************************\n"
	echo "
'-c' or '--cpu': Cpu information
'-r' or '--ram': Ram information
'-d' or '--disk': Disk information
'-u' or '--usb': Usb information
'-g' or '--gpu': Gpu information
'-m' or '--motherboard': Motherboard information
'-o' or '--os': Operation system "
}

info () {
	echo "write '-h' or '--help' to see information about script" 
}

while [ "$1" != "" ]; do
	case $1 in
		-r | --ram) ram_info
		;;
		-c | --cpu) cpu_info
		;;
		-d | --disk) disk_info
		;;
		-u | --usb) usb_info
        	;;
		-g | --gpu) gpu_info
		;;
		-m | --motherboard) motherboard_info
		;;
		-o | --os) os_info
		;;
		-h | --help) help_info
	esac
	echo -e "\n*******************************************************************"
	exit 1
shift
done                                                    
info
