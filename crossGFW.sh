#!/bin/sh

#service serverSpeeder restart
#ssserver -c /etc/shadowsocks.json --log-file /tmp/ss.log -d start
yum install wget git net-tools
wget --no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-go.sh
chmod +x shadowsocks-go.sh
./shadowsocks-go.sh 2>&1 | tee shadowsocks-go.log
#iptatbles -F
#iptables -A INPUT -p tcp --dport 8388 -j ACCEPT
#gollum &
