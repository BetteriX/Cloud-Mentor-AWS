#!/bin/sh

aws iam attach-role-policy \
    --role-name cmtr-ook9q7ho-iam-mp-iam_role-readonly \
    --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess

aws iam attach-role-policy \
    --role-name cmtr-ook9q7ho-iam-mp-iam_role-administrator \
    --policy-arn arn:aws:iam::aws:policy/AdministratorAccess 