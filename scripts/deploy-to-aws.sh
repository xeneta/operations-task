#!/bin/bash
export AWS_PAGER=""

cd ../aws/remote-state && terraform init && terraform apply -auto-approve
cd ../ && terraform init && terraform apply -auto-approve
terraform output -json | jq -r '@sh "export HOST=\(.db_host.value)\nexport PGPASSWORD=\(.rds_master_password.value)\nexport ACCOUNTID=\(.account_id.value)"' > env.sh && mv env.sh ../scripts
cd ../scripts
chmod 777 ./env.sh && source ./env.sh
./ecr-api.sh && ./rds.sh
aws ecs update-service --cluster dev-cluster --service app --force-new-deployment --region eu-west-2
cat env.sh
