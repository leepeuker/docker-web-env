include .env
export

up:
	mkdir -p db
	docker-compose up -d

down:
	docker-compose down

restart: down up

build: down
	docker-compose build

bash_php:
	docker exec -it php-fpm bash

bash_nginx:
	docker exec -it nginx bash

bash_mysql:
	docker exec -it mysql bash

log_php:
	docker logs -f php-fpm

log_nginx:
	docker logs -f nginx

log_mysql:
	docker logs -f mysql

certbot_init:
	docker exec -i nginx certbot register -m ${CERTBOT_EMAIL} --agree-tos --no-eff-email

certbot_create:
	docker exec -it nginx certbot --nginx
	
certbot_renew:
	docker exec -i nginx certbot renew --pre-hook "service nginx stop" --post-hook "service nginx start"

mysql_import:
	docker cp dump.sql mysql:/tmp/dump.sql
	docker exec -it mysql mysql -u root -p${MYSQL_ROOT_PASSWORD} leepeuker < /tmp/dump.sql