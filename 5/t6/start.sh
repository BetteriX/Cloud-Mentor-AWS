#!/bin/sh

aws ssm create-document \
    --name "MySQL-Script" \
    --document-type "Command" \
    --document-format "JSON" \
    --content file://command.json \
    --region eu-west-1

aws dlm create-lifecycle-policy \
    --execution-role-arn arn:aws:iam::448049824597:role/cmtr-ook9q7ho-ec2-s-DLMFullAccess \
    --description "DLM policy for cmtr-ook9q7ho-ec2-s-instance" \
    --state ENABLED \
    --policy-details file://dlm-policy.json \
    --tags Name=cmtr-ook9q7ho-policy \
    --region eu-west-1