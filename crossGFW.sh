#!/bin/sh

service serverSpeeder restart
ssserver -c /etc/shadowsocks.json --log-file /tmp/ss.log -d start
iptatbles -F
gollum &
