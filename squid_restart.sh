#!/bin/bash

systemctl restart squid
echo -n "$(date +%Y-%m-%d\ %H:%M:%S):"
echo "Squid restarted"
