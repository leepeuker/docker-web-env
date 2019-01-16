php_bash:
	docker exec -it php-fpm bash

php_log:
	docker logs -f php-fpm

nginx_bash:
	docker exec -it nginx bash

nginx_log:
	docker logs -f nginx

start_env:
	docker-compose up -d

stop_env:
	docker-compose down

build_env:
	docker-compose build