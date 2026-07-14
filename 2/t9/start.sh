#!/bin/sh

# T1
aws iam put-role-policy \
    --role-name cmtr-ook9q7ho-iam-sewk-iam_role \
    --policy-name kmsKeyAccess \
    --policy-document file://kms-key-access-role.json

# T2
aws s3api put-bucket-encryption \
    --bucket cmtr-ook9q7ho-iam-sewk-bucket-5942961-2 \
    --server-side-encryption-configuration file://bucket-encryption.json