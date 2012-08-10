#!/bin/bash

# $1 = ip
# $2 = hostname

echo "$1   $2" >> /etc/hosts;

dscacheutil -flushcache
