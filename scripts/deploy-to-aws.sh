#!/bin/bash
export AWS_PAGER=less

cd ../aws && terraform init && terraform apply -auto-approve && terraform output > outputs.txt
cd ../scripts && ./ecr-api.sh && ./rds.sh 
aws ecs update-service --cluster dev-cluster --service app --force-new-deployment --region eu-west-2
cd ../aws && cat outputs.txt
