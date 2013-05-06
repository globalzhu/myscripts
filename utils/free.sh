#!/bin/bash

free=$(free -m|grep Mem)

display=$(echo $free|awk '{print $4,$6,$7}')
echo [$display]
