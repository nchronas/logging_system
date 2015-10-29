#!/bin/bash

export PASSWD=${PASSWD:=root}
echo "root:$PASSWD" | chpasswd

chmod 644 /etc/logrotate.conf

udevd --daemon &
udevadm trigger &&

ln -s /usr/src/app/node_modules/coffee-script/bin/coffee /usr/local/bin/coffee
ln -s /usr/src/app/node_modules/coffee-script/bin/cake /usr/local/bin/cake

coffee /usr/src/app/server.coffee & 
coffee /usr/src/app/hello.coffee 