#!/bin/sh

aws apigatewayv2 update-route \
    --region eu-west-1 \
    --api-id 7axtajofj1 \
    --route-id 74vpaos \
    --route-key 'GET /contacts'