#!/bin/sh

aws secretsmanager put-secret-value \
  --secret-id cmtr-ook9q7ho-secret \
  --region eu-west-1 \
  --secret-string '{"MYSQL_ROOT_PASSWORD":"rootPassword","MYSQL_DATABASE":"wordpress","MYSQL_USER":"wordpress","MYSQL_PASSWORD":"wordpress"}'