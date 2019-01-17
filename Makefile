php_bash:
	docker exec -it php-fpm bash

php_log:
	docker logs -f php-fpm

nginx_bash:
	docker exec -it nginx bash

nginx_log:
	docker logs -f nginx

up:
	docker-compose up -d

down:
	docker-compose down

build: down
	docker-compose build