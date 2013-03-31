#!/bin/bash
#===============================================================================
#
#          FILE:  flush-iptables.sh
# 
#         USAGE:  ./flush-iptables.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  TimeBreaker (), slackwareer@gmil.com
#       COMPANY:  slackwareer.f3322.org
#       VERSION:  1.0
#       CREATED:  2013年02月04日 07时04分01秒 CST
#      REVISION:  ---
#===============================================================================

cd /download/iptables
./reset_rules.sh
