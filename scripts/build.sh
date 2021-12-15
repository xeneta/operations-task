#!/bin/bash

cd .. && docker build . -t api:latest
docker-compose up -d
