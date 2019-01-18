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
