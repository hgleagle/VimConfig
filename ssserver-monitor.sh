#!/bin/sh

filename="port-ip-monitor.log"
regex="838[1-8]"  # monitor 8381-8388

date +"[%Y-%m-%d %H:%M:%S]" >> $filename
netstat -anp | egrep $regex | grep -E "tcp.*ESTABLISHED" | awk '{print $4, $5}' | cut -d: -f2 | sort -u >> $filename

