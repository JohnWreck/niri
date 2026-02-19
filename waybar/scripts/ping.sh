#!/usr/bin/env bash

# Configurable: change target and interval as needed
HOST="8.8.8.8"          # Google DNS (very reliable)
INTERVAL=10             # seconds between pings (don't go too low → CPU/network spam)
TIMEOUT=2               # seconds to wait for reply

# One ping, quiet, get the time in ms
PING=$(ping -c 1 -W "$TIMEOUT" "$HOST" 2>/dev/null | grep 'time=' | awk -F 'time=' '{print $2}' | awk '{print $1}')
if [ -n "$PING" ]; then

    echo "${PING}ms"
else
    echo "Offline"
fi
