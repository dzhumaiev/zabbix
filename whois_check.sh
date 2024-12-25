#!/bin/bash

# run as # ./whois_check.sh domain.name

expiry_date=$(whois $1 | \
grep -Ei 'Expire|Expires|Expiry|expiration|expire|expiry|expires|Until' | \
sed -En 's/.*([0-9]{4}-[0-9]{2}-[0-9]{2}).*/\1/p' | head -1)

# Calculate the difference in seconds between the expiry date and the current date
seconds_diff=$(($(date -d "$expiry_date" +%s) - $(date +%s)))

# Calculate the number of days left by dividing the difference in seconds by the number of seconds in a day (86400)
days_left=$((seconds_diff / 86400))

echo "$days_left"
