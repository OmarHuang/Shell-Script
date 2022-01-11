#!/bin/bash

# Set ping test target IP
target="192.168.1.90"

for i in {1..5}; do
    ping -c 3 $target
    # Check if target is okay and break the loop
    if [ "$?" -eq 0 ]; then
        echo "$(date) $target is okay." >> /var/log/ping_test.log
        break
    # Check if target is unreachable and reach maximum attempt
    elif [ "$i" -eq 5 ]; then
    	echo "$(date) $target is unreachable." >> /var/log/ping_test.log
        sudo shutdown -h now
        break
    else
        sleep 60
    fi
done
