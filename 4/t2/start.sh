#!/bin/bash

set -e

REGION="eu-west-1"
PUBLIC_SG="sg-09a9fe67a90c7a86e"
PRIVATE_SG="sg-0555583432f884dfe"

echo "Adding HTTP rule: Private -> Public"
aws ec2 authorize-security-group-ingress \
  --region "$REGION" \
  --group-id "$PUBLIC_SG" \
  --protocol tcp \
  --port 80 \
  --source-group "$PRIVATE_SG"

echo "Adding ICMP rule: Private -> Public"
aws ec2 authorize-security-group-ingress \
  --region "$REGION" \
  --group-id "$PUBLIC_SG" \
  --protocol icmp \
  --port -1 \
  --source-group "$PRIVATE_SG"

echo "Adding HTTP rule: Public -> Private"
aws ec2 authorize-security-group-ingress \
  --region "$REGION" \
  --group-id "$PRIVATE_SG" \
  --protocol tcp \
  --port 80 \
  --source-group "$PUBLIC_SG"

echo "Adding ICMP rule: Public -> Private"
aws ec2 authorize-security-group-ingress \
  --region "$REGION" \
  --group-id "$PRIVATE_SG" \
  --protocol icmp \
  --port -1 \
  --source-group "$PUBLIC_SG"

echo "Security group rules configured successfully."
