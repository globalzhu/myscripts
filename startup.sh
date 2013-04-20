#!/bin/bash
fetch_parameter.sh password password | sudo -S ./cpu_freq.sh
fetch_parameter.sh password password | sudo ./ntp.sh
