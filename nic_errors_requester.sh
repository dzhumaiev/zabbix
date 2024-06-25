#!/bin/bash
last_days=5
GET_ERRORS=$(journalctl --since "$last_days days ago" | grep -E 'Detected Hardware Unit Hang|Reset adapter unexpectedly' | tail -n 10)
ETHTOOL_STATUS=$(ethtool -k $(ifconfig -a | head -n 1 | grep -o '^[a-zA-Z0-9]*') | grep -E -- 'rx-checksumming|tx-checksumming')

HOSTMSG="$(hostname)"
SENDMSG="$HOSTMSG, NIC fails log for $last_days days %0A$GET_ERRORS %0A$ETHTOOL_STATUS"

if [ -z "$GET_ERRORS" ]
then
        exit 0
else
        exit 1
fi
