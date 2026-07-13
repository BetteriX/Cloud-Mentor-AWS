#!/bin/sh

# task1
aws iam put-role-policy \
	--role-name cmtr-ook9q7ho-iam-ar-iam_role-assume \
	--policy-name AllowAssumeReadonly \
  	--policy-document file://assume-policy.json

# task2
aws iam attach-role-policy \
	--role-name cmtr-ook9q7ho-iam-ar-iam_role-readonly \
	--policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess

# task3
aws iam update-assume-role-policy \
	--role-name cmtr-ook9q7ho-iam-ar-iam_role-readonly \
	--policy-document file://trust-policy.json

