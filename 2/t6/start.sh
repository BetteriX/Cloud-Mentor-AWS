#!/bin/sh

# T1: attach the policy to allow s3 fullaccess
aws iam attach-role-policy \
    --role-name cmtr-ook9q7ho-iam-peld-iam_role \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess

# T2: Deny bucket object deletion
aws s3api put-bucket-policy \
    --bucket cmtr-ook9q7ho-iam-peld-bucket-3747762 \
    --policy file://s3-policy.json