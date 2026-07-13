#!/bin/sh

aws iam attach-group-policy \
	--group-name cmtr-ook9q7ho-iam-g-group-developers \
	--policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess
