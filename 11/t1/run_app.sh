#!/bin/bash

REPO_URI=195275646656.dkr.ecr.eu-west-1.amazonaws.com/cmtr-ook9q7ho

docker stop alpine-httpd-container || true
docker rm alpine-httpd-container || true

docker run -d --name alpine-httpd-container -p 80:80 $REPO_URI:alpine-httpd