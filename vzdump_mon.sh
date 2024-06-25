#!/bin/bash

vmid=( $(cat /etc/pve/jobs.cfg  | grep 'vmid '| awk '{print $2}' | sed 's/,/\n/g') )

for i in "${vmid[@]}"
do
        checklog=$(cat /var/log/vzdump/qemu-$i.log | grep "Finished Backup of VM $i")
        if [ -z "$checklog" ]
        then
                exit 1
        else
                continue
        fi
done
