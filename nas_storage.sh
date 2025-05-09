#!/usr/bin/bash

# Put this script in the /usr/lib/zabbix/externalscripts/

NFS_ADDRESS=$2
UNAME=$1
PORT='23'

MOUNTS=$(ssh -o StrictHostKeyChecking=no -i /usr/lib/zabbix/externalscripts/.ssh/nas $UNAME@$NFS_ADDRESS -p$PORT 'df -h')
USED_STOR_PERCENT=$(echo "${MOUNTS}" | grep $UNAME | awk '{print $5}' | sed 's/%//g')

#USED_STOR_PERCENT=82
echo $USED_STOR_PERCENT
exit
