#!/bin/bash

ip_base=$(docker network inspect kind --format '{{ (index .IPAM.Config 0).Subnet }}' | awk -F'.' '{printf "%s.%s.%s", $1, $2, $3}')

echo "$ip_base.120-$ip_base.129"

