include .env
export

up:
	mkdir -p db
	docker-compose up -d

down:
	docker-compose down

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
	docker exec -i nginx apt-get install -y python-certbot-nginx -t stretch-backports
	docker exec -i nginx certbot register -m ${CERTBOT_EMAIL} --agree-tos --no-eff-email
	docker exec -it nginx certbot --nginx