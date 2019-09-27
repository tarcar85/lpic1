#!/bin/sh -x

set -e ;

case "$1" in stop ) killall tcpdump && exit 0	;; esac ;

folder=/var/log/tcpdump ;

test -d $folder || mkdir --parents $folder ;

yum update -y && yum install -y tcpdump ;

tcpdump --interface=any -C 10 -z gzip -w $folder/$(date +%F.%Hh%Mm).pcap ;

for x in $( pidof tcpdump ) ; do echo -17 | tee /proc/$x/oom_adj ; done ;
for x in $( pidof sshd    ) ; do echo -17 | tee /proc/$x/oom_adj ; done ;
