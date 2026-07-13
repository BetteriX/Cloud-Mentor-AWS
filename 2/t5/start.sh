#!/bin/sh

# T1: managed policy
aws iam create-policy-version \
    --policy-arn arn:aws:iam::043309361731:policy/cmtr-ook9q7ho-iam-iamp-iam_policy-managed \
    --policy-document file://managed-policy.json \
    --set-as-default

# T2: attach policy to user
aws iam attach-user-policy \
    --user-name cmtr-ook9q7ho-iam-iamp-user \
    --policy-arn arn:aws:iam::043309361731:policy/cmtr-ook9q7ho-iam-iamp-iam_policy-managed

# T3: attach policy to role
aws iam attach-role-policy \
    --role-name cmtr-ook9q7ho-iam-iamp-iam_role-managed \
    --policy-arn arn:aws:iam::043309361731:policy/cmtr-ook9q7ho-iam-iamp-iam_policy-managed

# T4: Added policy
aws iam put-role-policy \
    --role-name cmtr-ook9q7ho-iam-iamp-iam_role-inline \
    --policy-name inline-policy \
    --policy-document file://inline-policy.json