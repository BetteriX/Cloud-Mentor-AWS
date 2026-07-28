import json
import os
import urllib.request

import boto3

IPINFO_TOKEN = os.environ["IPINFO_TOKEN"]
SNS_TOPIC_ARN = os.environ["SNS_TOPIC_ARN"]

sns = boto3.client("sns")

def lambda_handler(event, context):
    ip_address = event["ip_address"]

    url = f"https://ipinfo.io/{ip_address}?token={IPINFO_TOKEN}"

    with urllib.request.urlopen(url) as response:
        data = json.loads(response.read().decode())

    city = data["city"]

    message = {
        "ip_address": ip_address,
        "city": city
    }

    sns.publish(
        TopicArn=SNS_TOPIC_ARN,
        Message=json.dumps(message)
    )

    return {
        'statusCode': 200,
        'body': json.dumps(message)
    }
