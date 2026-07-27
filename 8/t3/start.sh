#!/bin/sh

aws ecs update-service \
    --cluster cmtr-ook9q7ho-ecs-tu-ecs_cluster \
    --service ECS_task_update_service \
    --task-definition nginx_v2:1 \
    --force-new-deployment \
    --region eu-west-1
