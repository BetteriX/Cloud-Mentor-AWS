#!/bin/sh

# T1: added inline policy to allow list buckets
aws iam put-role-policy \
    --role-name cmtr-ook9q7ho-iam-pela-iam_role  \
    --policy-name AllowBucketList \
    --policy-document file://s3-policy.json

# T2: allow to list buckets, put, get objects
aws s3api put-bucket-policy \
    --bucket cmtr-ook9q7ho-iam-pela-bucket-1-2339015 \
    --policy file://bucket-1-policy.json