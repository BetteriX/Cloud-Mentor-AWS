#!/bin/sh

aws ec2 create-tags \
  --resources vol-082abb4e712e8cb9b \
  --tags Key=eks:eks-cluster-name,Value=cmtr-ook9q7ho-eks-cluster Key=kubernetes.io/cluster/cmtr-ook9q7ho-eks-cluster,Value=owned \
  --region eu-west-1