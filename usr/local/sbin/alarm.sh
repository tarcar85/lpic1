#!/bin/sh
set -e
MAILTO="root"
MAILFROM="check"
UNIT=$1
ps_output=$(/bin/ps -ewwo vsz,user,uid,tt,start,s,ruser,ruid,rsz,psr,pri,ppid,pid,pcpu,ni,min_flt,maj_flt,cmd)
df_output=$(df)
df_i_output=$(df -i)
vmstat_output=$(/usr/bin/vmstat)
vmstat_s_output=$(/usr/bin/vmstat -s)
vmstat_d_output=$(/usr/bin/vmstat -d)
vmstat_D_output=$(/usr/bin/vmstat -D)
netstat_output=$(/bin/netstat -putana)
/usr/bin/mail -s "Alarm for unit: $UNIT" $MAILTO <<EOF
From:$MAILFROM
To:$MAILTO

Alarm for unit: $UNIT

PS Output:
$ps_output

DF Output:
$df_output

DF -i Output:
$df_i_output

VMSTAT Output:
$vmstat_output

VMSTAT -s Output:
$vmstat_s_output

VMSTAT -d Output:
$vmstat_d_output

VMSTAT -D Output:
$vmstat_D_output

NETSTAT -putana Output:
$netstat_output

EOF
exit 0
