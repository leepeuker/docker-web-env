# Docker environment for php web development 
This is a docker enviroment for php web development and handling one or multiple projects. Easy way for obtaining ssl certificates included. 

#### Containers
- nginx [latest]
- php-fpm [7.2]
- mysql [5.7]

#### Install and configuration

```sh
$ git clone https://github.com/leepeuker/docker-web-env.git
$ cp .env.dist .env
```

Change the default configuration in the .env file.

#### Directory structure
- ./build/ - Build files for docker images
- ./db/ - Database files for persistant storage
- ./etc/ - Configuration files for programms and services
- ./projects/ - Project files

#### Make commands
For easier interacting with docker and the container.

 **Format:** make [command]

| Command | Description |
| ------ | ------ |
| up | Start containers |
| down | Stop containers |
| restart | Stop and start containers |
| build | Rebuild images |
| bash_php | Open bash to php-fpm container |
| bash_mysql | Open bash to mysql container |
| bash_nginx | Open bash to nginx container |
| log_php | Get php-fpm container log stream |
| log_mysql | Get mysql container log stream |
| log_nginx | Get nginx container log stream |
| certbot_init | Initialize certbot and create first ssl certificate/s |
| certbot_create | Create ssl certificate/s |
| certbot_renew | Renew existing ssl certificate/s |
