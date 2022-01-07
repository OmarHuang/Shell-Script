#!/bin/bash

# Set ping test target IP
target="192.168.1.90"

for i in {1..5}; do
    ping -c 3 $target
    if [ "$?" -eq 0 ]; then
        echo "$(date) $target is okay." >> /var/log/ping_test.log
        break
    elif [ "$i" -eq 5 ]; then
	    echo "$(date) $target is unreachable." >> /var/log/ping_test.log
        sudo shutdown -h now
        break
    else
        sleep 60
    fi
done
