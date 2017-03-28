#!/bin/sh

service serverSpeeder restart
ssserver -c /etc/shadowsocks.json --log-file /tmp/ss.log -d start
#iptatbles -F
iptables -A INPUT -p tcp --dport 8388 -j ACCEPT
gollum &
