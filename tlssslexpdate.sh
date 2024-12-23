#!/bin/bash

#set -x

DOMAIN_NAME_IS=$1

echo | openssl s_client -connect $DOMAIN_NAME_IS:443 2>/dev/null | \
openssl x509 -noout -enddate | \
sed 's/notAfter=//' | \
xargs -I{} date -d "{}" +%s | \
awk -v now=$(date +%s) '{print int(($1 - now) / (60 * 60 * 24))}'

#set +x

exit
