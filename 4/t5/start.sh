#!/bin/sh

aws iam attach-role-policy \
    --role-name cmtr-ook9q7ho-ec2-sms-iam_role \
    --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore

aws ec2 associate-iam-instance-profile \
    --instance-id i-04e3756ebf71cad4e \
    --iam-instance-profile Arn=arn:aws:iam::060795937249:instance-profile/cmtr-ook9q7ho-ec2-sms-instance_profile # or Name=cmtr-ook9q7ho-ec2-sms-instance_profile
    # Found the arn in iam->roles->cmtr-ook9q7ho-ec2-sms-iam_role

# At the end: (Restarted the instance and connected to it)
# aws ssm start-session --target i-04e3756ebf71cad4e