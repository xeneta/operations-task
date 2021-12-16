#!/bin/bash

docker build ../ -t api -f ../Dockerfile 
docker build ../ -t db -f ../db.Dockerfile

aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin $ACCOUNTID.dkr.ecr.eu-west-2.amazonaws.com

docker tag api $ACCOUNTID.dkr.ecr.eu-west-2.amazonaws.com/api:latest
docker tag db $ACCOUNTID.dkr.ecr.eu-west-2.amazonaws.com/db:latest

docker push $ACCOUNTID.dkr.ecr.eu-west-2.amazonaws.com/api:latest
docker push $ACCOUNTID.dkr.ecr.eu-west-2.amazonaws.com/db:latest
