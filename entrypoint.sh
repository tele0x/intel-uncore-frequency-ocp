#!/bin/sh

if lsmod | grep intel-uncore-frequency; then
	echo -e "Unloading module"
	/usr/sbin/rmmod intel-uncore-frequency
fi 

echo -e "Loading intel-uncore-frequency module.."
/usr/sbin/depmod -a
/usr/sbin/modprobe intel-uncore-frequency
echo -e "Module loaded: "
if lsmod | grep intel-uncore-frequency; then
   /usr/sbin/modinfo intel-uncore-frequency
fi

while true; do sleep 15 ; lsmod | grep intel-uncore-frequency $? -eq 0 || echo "intel-uncore-frequency kernel module not loaded" && exit 1; done
