#!/bin/sh

aws iam update-assume-role-policy \
    --role-name cmtr-ook9q7ho-eventbridge-lesm-iam_role \
    --policy-document file://trust-policy.json

aws events put-rule \
    --name cmtr-ook9q7ho-eventbridge-lesm-event_rule-start \
    --schedule-expression "cron(0 8 * * ? *)" \
    --description "Rule to start ec2 instances by cron"

aws events put-rule \
    --name cmtr-ook9q7ho-eventbridge-lesm-event_rule-stop \
    --schedule-expression "cron(0 20 * * ? *)" \
    --description "Rule to stop ec2 instances by cron"

aws events put-targets \
    --rule cmtr-ook9q7ho-eventbridge-lesm-event_rule-start \
    --targets '[
        {
            "Id": "Target_start",
            "Arn": "arn:aws:lambda:eu-west-1:842676008964:function:cmtr-ook9q7ho-eventbridge-lesm-lambda",
            "Input": "{\"action\":\"start\"}"
        }
    ]'

aws events put-targets \
    --rule cmtr-ook9q7ho-eventbridge-lesm-event_rule-stop \
    --targets '[
        {
            "Id": "Target_start",
            "Arn": "arn:aws:lambda:eu-west-1:842676008964:function:cmtr-ook9q7ho-eventbridge-lesm-lambda",
            "Input": "{\"action\":\"stop\"}"
        }
    ]'