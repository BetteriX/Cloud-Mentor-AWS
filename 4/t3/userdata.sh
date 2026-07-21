#!/bin/bash

# Found in ec2->Instances->Selected instances->Actions->Instance Settings->Edit user data

sudo dnf install -y nginx

instanceIp=$(curl http://checkip.amazonaws.com)
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
instanceId=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
echo "<h1>WebServer (${instanceIp}) with ID: ${instanceId}</h1>" > /usr/share/nginx/html/index.html

sudo systemctl enable nginx
sudo systemctl start nginx