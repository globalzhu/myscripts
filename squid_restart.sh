#!/bin/bash

systemctl restart squid
echo -n "$(date):"
echo "Squid restarted"
