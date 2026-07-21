#!/bin/sh

CUSTOMER_ARN=arn:aws:elasticloadbalancing:eu-west-1:343218225086:targetgroup/cmtr-ook9q7ho-ec2-es-tg-cust/e7af27944e89e6a6
ORDERS_ARN=arn:aws:elasticloadbalancing:eu-west-1:343218225086:targetgroup/cmtr-ook9q7ho-ec2-es-tg-orders/8ad02e9065e55a43
TCP_ARN=arn:aws:elasticloadbalancing:eu-west-1:343218225086:targetgroup/cmtr-ook9q7ho-ec2-es-tg-tcp/a4df5efc409566ad
UDP_ARN=arn:aws:elasticloadbalancing:eu-west-1:343218225086:targetgroup/cmtr-ook9q7ho-ec2-es-tg-udp/11b8f82447fefc38

# T1: Attach loadbalancers to ec2 instances
aws elbv2 register-targets \
    --target-group-arn $CUSTOMER_ARN \
    --targets Id=i-079f084ecde9002ca

aws elbv2 register-targets \
    --target-group-arn $ORDERS_ARN \
    --targets Id=i-0f7d43ae76372bd23

aws elbv2 register-targets \
    --target-group-arn  $TCP_ARN \
    --targets Id=i-0bec95f574cbe5390

aws elbv2 register-targets \
    --target-group-arn  $UDP_ARN \
    --targets Id=i-0c23f98b4fa5c832d

# T2: Creating two new listeners
NETWORK_LB=arn:aws:elasticloadbalancing:eu-west-1:343218225086:loadbalancer/net/cmtr-ook9q7ho-ec2-es-nlb/809496ff07efe1ef

aws elbv2 create-listener \
    --load-balancer-arn $NETWORK_LB \
    --protocol TCP \
    --port 3000 \
    --default-actions Type=forward,TargetGroupArn=$TCP_ARN

aws elbv2 create-listener \
    --load-balancer-arn $NETWORK_LB \
    --protocol UDP \
    --port 7788 \
    --default-actions Type=forward,TargetGroupArn=$UDP_ARN

# T3: Adding rules to a existing load balancer (The listener arn are already made and i copied that arn)
LISTENER_ARN=arn:aws:elasticloadbalancing:eu-west-1:343218225086:listener/app/cmtr-ook9q7ho-ec2-es-lb/b34af08d71e13c73/d8180d87089e1cb0

aws elbv2 create-rule \
    --listener-arn $LISTENER_ARN \
    --priority 10 \
    --conditions Field=path-pattern,Values='/customers' \
    --actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:eu-west-1:343218225086:targetgroup/cmtr-ook9q7ho-ec2-es-tg-cust/e7af27944e89e6a6

aws elbv2 create-rule \
    --listener-arn $LISTENER_ARN \
    --priority 20 \
    --conditions Field=path-pattern,Values='/orders' \
    --actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:eu-west-1:343218225086:targetgroup/cmtr-ook9q7ho-ec2-es-tg-orders/8ad02e9065e55a43

aws elbv2 modify-listener \
    --listener-arn $LISTENER_ARN \
    --default-actions Type=redirect,RedirectConfig="{Protocol=HTTP,Port=80,Host='#{host}',Path='/orders',Query='#{query}',StatusCode=HTTP_302}"