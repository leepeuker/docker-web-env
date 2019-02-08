include .env
export

up:
	mkdir -p db
	mkdir -p log/nginx
	docker-compose up -d

down:
	docker-compose down

restart: down up

build: down
	docker-compose build

bash_php:
	docker exec -it  ${PHP_CONTAINER_NAME} bash

bash_nginx:
	docker exec -it ${NGINX_CONTAINER_NAME} bash

bash_mysql:
	docker exec -it ${MYSQL_CONTAINER_NAME} bash

log_php:
	docker logs -f ${PHP_CONTAINER_NAME}

log_nginx:
	docker logs -f ${NGINX_CONTAINER_NAME}

log_mysql:
	docker logs -f ${MYSQL_CONTAINER_NAME}

certbot_init:
	docker exec -i ${NGINX_CONTAINER_NAME} certbot register -m ${CERTBOT_EMAIL} --agree-tos --no-eff-email

certbot_create:
	docker exec -it ${NGINX_CONTAINER_NAME} certbot --nginx
	
certbot_renew:
	docker exec -i ${NGINX_CONTAINER_NAME} certbot renew --pre-hook "service nginx stop" --post-hook "service nginx start"

mysql_import:
	docker cp dump.sql mysql:/tmp/dump.sql
	docker exec -it ${MYSQL_CONTAINER_NAME} mysql -u root -p${MYSQL_ROOT_PASSWORD} leepeuker < /tmp/dump.sql