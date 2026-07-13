#!/bin/sh

aws iam put-role-policy \
    --role-name cmtr-ook9q7ho-iam-c-iam_role \
    --policy-name deny-s3-policy \
    --policy-document file://deny-s3-policy.json

aws iam put-role-policy \
    --role-name cmtr-ook9q7ho-iam-c-iam_role \
    --policy-name deny-ec2-policy \
    --policy-document file://deny-ec2-policy.json