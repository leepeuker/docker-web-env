include .env

# Project management
#####################
init: build
	cp etc/nginx/nginx.conf.dist etc/nginx/nginx.conf
	cp etc/php/php.ini.${ENV}.dist etc/php/php.ini


# Container management
######################
up:
	mkdir -p db
	mkdir -p log/nginx
	docker-compose up -d

down:
	docker-compose down

reup: down up

build: down
	docker-compose build --no-cache --build-arg USER_ID=${USER_ID}


# Container interaction
#######################
connect_php_bash:
	docker exec -it  php bash

connect_nginx_bash:
	docker exec -it nginx sh

connect_mysql_cli:
	docker exec -it mysql bash -c "mysql -uroot -p${MYSQL_ROOT_PASSWORD}"

logs_php:
	docker logs -f php

logs_nginx:
	docker logs -f nginx

logs_mysql:
	docker logs -f mysql

reload_nginx:
	docker exec -it nginx bash -c "service nginx reload"


# Certbot - Let's encrypt
#########################
certbot_init:
	docker exec -i nginx certbot register -m ${CERTBOT_EMAIL} --agree-tos --no-eff-email

certbot_create:
	docker exec -it nginx certbot --nginx
	
certbot_renew:
	docker exec -i nginx certbot renew 


# Database
##########
db_import:
	docker cp dump.sql mysql:/tmp/dump.sql
	docker exec -it mysql bash -c "mysql -u root -p${MYSQL_ROOT_PASSWORD} < /tmp/dump.sql"

db_export:
	docker exec -it mysql bash -c "mysqldump --databases --add-drop-database -u root -p${MYSQL_ROOT_PASSWORD} ${DB_NAME} > /tmp/dump.sql"
	docker cp mysql:/tmp/dump.sql tmp/${DB_NAME}.sql 

db_create:
	docker exec -it mysql bash -c "mysql -u root -p${MYSQL_ROOT_PASSWORD} <<< 'CREATE DATABASE ${DB_NAME};'"

db_drop:
	docker exec -it mysql bash -c "mysql -u root -p${MYSQL_ROOT_PASSWORD} <<< 'DROP DATABASE ${DB_NAME};'"
	