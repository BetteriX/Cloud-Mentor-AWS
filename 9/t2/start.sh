#!/bin/sh

echo "Creating API Gateay integration"
INTEGRATION_ID=$(aws apigatewayv2 create-integration \
    --region eu-west-1 \
    --api-id 7axtajofj1 \
    --integration-type AWS_PROXY \
    --integration-method POST \
    --payload-format-version 2.0 \
    --integration-uri arn:aws:lambda:eu-west-1:122610514167:function:cmtr-ook9q7ho-api-gwlp-lambda-contacts \
    --query 'IntegrationId' \
    --output text)

echo "Integration ID: ${INTEGRATION_ID}"

echo "route update"
aws apigatewayv2 update-route \
    --region eu-west-1 \
    --api-id 7axtajofj1 \
    --route-id 74vpaos \
    --target integrations/${INTEGRATION_ID}

echo "Lambda permissions"
aws lambda add-permission \
    --region eu-west-1 \
    --function-name cmtr-ook9q7ho-api-gwlp-lambda-contacts \
    --statement-id api-gateway-access \
    --action lambda:InvokeFunction \
    --principal apigateway.amazonaws.com \
    --source-arn "arn:aws:execute-api:eu-west-1:122610514167:7axtajofj1/*"
