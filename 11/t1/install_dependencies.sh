#!/bin/bash

REPO_URI=195275646656.dkr.ecr.eu-west-1.amazonaws.com/cmtr-ook9q7ho

sudo yum update -y
sudo yum install -y docker

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user

aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin $REPO_URI
docker pull $REPO_URI:alpine-httpd