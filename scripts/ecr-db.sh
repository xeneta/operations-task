docker build ../ -t db -f ../db.Dockerfile

aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin $ACCOUNTID.dkr.ecr.eu-west-2.amazonaws.com

docker tag db $ACCOUNTID.dkr.ecr.eu-west-2.amazonaws.com/db:latest

docker push $ACCOUNTID.dkr.ecr.eu-west-2.amazonaws.com/db:latest
