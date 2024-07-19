#!/bin/sh
echo "Enabling SSH"
sed -i s/release/XXXXXX/g /etc/init.d/dropbear

nvram set ssh_en=1
nvram commit

/etc/init.d/dropbear enable
/etc/init.d/dropbear restart
