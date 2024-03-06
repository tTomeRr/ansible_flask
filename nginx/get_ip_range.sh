#!/bin/bash

ip_base=$(docker network inspect -f '{{.IPAM.Config}}' kind | awk '{print $3}' | tr -d '{/' | awk -F'.' '{printf "%s.%s.%s\n", $1, $2, $3}')

echo "$ip_base.120-$ip_base.129"

