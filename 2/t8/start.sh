#!/bin/sh

# T1
aws iam attach-role-policy \
    --role-name cmtr-ook9q7ho-iam-lp-iam_role \
    --policy-arn arn:aws:iam::aws:policy/AWSLambda_ReadOnlyAccess

# T2: made the mistake by giving the wrong API ID (t3y36a8omi)
aws lambda add-permission \
    --function-name cmtr-ook9q7ho-iam-lp-lambda \
    --statement-id AllowAPIGatewayInvoke \
    --action lambda:InvokeFunction \
    --principal apigateway.amazonaws.com \
    --source-arn arn:aws:execute-api:eu-west-1:034362042474:t3y36a8omi/*