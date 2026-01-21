#!/bin/sh
echo "Enabling telnet"
sed -i 's#/usr/sbin/telnetd#/data/userdisk/telnetd#g' /etc/init.d/telnet

nvram set telnet_en=1
nvram commit

/etc/init.d/telnet enable
/etc/init.d/telnet restart
