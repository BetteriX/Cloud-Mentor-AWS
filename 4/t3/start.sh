#!/bin/sh

TEMPLATE_NAME="cmtr-ook9q7ho-ec2-us-lt"
USERDATA_BASE64=$(base64 -w0 userdata.sh)

# Create new launch template version
VERSION=$(aws ec2 create-launch-template-version \
  --launch-template-name "$TEMPLATE_NAME" \
  --source-version '$Latest' \
  --launch-template-data "{\"UserData\":\"$USERDATA_BASE64\"}" \
  --query 'LaunchTemplateVersion.VersionNumber' \
  --output text)

echo "Created launch template version: $VERSION"

# Set new version as default
aws ec2 modify-launch-template \
  --launch-template-name "$TEMPLATE_NAME" \
  --default-version "$VERSION"

echo "Set version $VERSION as default"