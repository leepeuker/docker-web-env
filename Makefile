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
	docker-compose build


# Container interaction
#######################
connect_php_bash:
	docker exec -it  php bash

connect_nginx_bash:
	docker exec -it nginx sh

connect_mysql_cli:
	docker exec -it mysql bash -c "mysql"

logs_php:
	docker logs -f php

logs_nginx:
	docker logs -f nginx

logs_mysql:
	docker logs -f mysql


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
mysql_import:
	docker cp dump.sql mysql:/tmp/dump.sql
	docker exec -it mysql bash -c "mysql -u root -p${MYSQL_ROOT_PASSWORD} < /tmp/dump.sql"