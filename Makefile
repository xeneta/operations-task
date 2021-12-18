app:
	cd scripts && ./build.sh

destroy:
	docker-compose down

ecr-api:
	cd scripts && ./ecr-api.sh && aws ecs update-service --cluster dev-cluster --service app --force-new-deployment --region eu-west-2

cloud-locally:
	cd scripts && ./deploy-to-aws.sh
