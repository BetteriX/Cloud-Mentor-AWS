#!/bin/sh

# T1: adding bucket notification (to trigger when file creation)
aws s3api put-bucket-notification-configuration \
	--bucket cmtr-ook9q7ho-s3-snlt-bucket-463108 \
	--region eu-west-1 \
	--notification-configuration file://notification.json

# T2: creating event source mapping
aws lambda create-event-source-mapping \
	--function-name cmtr-ook9q7ho-s3-snlt-lambda \
	--event-source-arn arn:aws:sqs:eu-west-1:703671904175:cmtr-ook9q7ho-s3-snlt-queue \
	--region eu-west-1

# T3
aws s3 cp upload.txt s3://cmtr-ook9q7ho-s3-snlt-bucket-463108/input/upload.txt --region eu-west-1
