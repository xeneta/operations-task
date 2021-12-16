app:
	cd scripts && ./build.sh

destroy:
	docker-compose down

test:
	curl "http://127.0.0.1:3000/rates?date_from=2021-01-01&date_to=2021-01-31&orig_code=CNGGZ&dest_code=EETLL"

ecr:
	cd scripts && ./ecr.sh
