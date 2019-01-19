up:
	docker-compose up -d

down:
	docker-compose down

build: down
	docker-compose build

bash_php:
	docker exec -it php-fpm bash

bash_nginx:
	docker exec -it nginx bash

log_php:
	docker logs -f php-fpm

log_nginx:
	docker logs -f nginx

db_import: 
	docker exec -i db mysql -u root -proot -e "drop database if exists test-db"
	docker exec -i db mysql -u root -proot -e "create database if not exists test-db"
	docker cp dump.sql db:/tmp/dump.sql
	docker exec -i db mysql -u root -proot test-db < dump.sql