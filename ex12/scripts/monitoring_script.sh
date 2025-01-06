#!/bin/bash
yum update -y
yum install -y curl
# shellcheck disable=SC2154
echo "Listing servers... ${aws_instance.servers[*].public_ip}" > app.txt
# shellcheck disable=SC2154
for ip in ${join(" ", aws_instance.servers[*].public_ip)}; do
  echo "Checking server at $ip..." > ips.txt
  curl -s "http://$ip" || echo "Server at $ip is DOWN"
done