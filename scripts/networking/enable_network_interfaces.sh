#!/usr/bin/env bash

set -e

export NUMBER_OF_INTERFACES=`lspci | grep -i eth | wc -l`

for ((i=1;i<$NUMBER_OF_INTERFACES;i++)); do
    sudo dhclient eth$i 2>/dev/null
    sudo ifconfig eth$i up 2>/dev/null
done

sudo sysctl -w net.ipv4.ip_forward=1 &>/dev/null
