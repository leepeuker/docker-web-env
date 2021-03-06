# Docker environment for php web development 
This is a docker enviroment for php web development with XDebug support and handling one or multiple websites. Easy way for obtaining SSL certificates via [Let's Encrypt](https://letsencrypt.org/) included. 

#### Containers
- nginx [latest]
- php-fpm [7.2]
- mysql [5.7]

#### Installation and configuration

```sh
$ git clone https://github.com/leepeuker/docker-web-env.git
$ cp .env.dist .env
$ make init
```

Important first steps:
  - Change the default configuration in the .env file 
  - Edit etc/nginx/conf.d/default.conf (or remove it/add new .conf files) to customize your server/s
  - These and some other changes may require you to restart the containers to activate the new configurations ("make restart")
  
#### Directory structure
Some of these directories and files do not exist yet, but will be automatically created on the containers first start
- build/ - Build files for docker images
- db/ - Database files for persistant storage
- etc/ - Configuration files for programms and services
  - letsencrypt/ - SSL certifcates, account informations, ...
  - nginx/ - Nginx configuration files 
    - auth/ - Intended location for .htpasswd file (file must be created manually if needed)
    - conf.d/ - Host configuration file/s
    - nginx.conf - Server configuration file
  - php/ - PHP configuration files 
    - php.ini.dev.dist - Example dev configuration file
    - php.ini.prod.dist - Example prod configuration file

#### Make commands
For easier interacting with docker and the container.

 **Format:** make [command]

| Command | Description |
| ------ | ------ |
| up | Create and start containers |
| down | Stop and remove containers |
| restart | Runs "down" and "up" command |
| build | Build docker images |
| connect_php_bash | Open bash to php-fpm container |
| connect_nginx_bash | Open bash to nginx container |
| connect_mysql_cli | Open mysql cli to mysql container |
| log_php | Get php-fpm container log stream |
| log_mysql | Get mysql container log stream |
| log_nginx | Get nginx container log stream |
| log_nginx_export | Copy nginx logs to host |
| certbot_init | Initialize certbot |
| certbot_create | Create ssl certificate/s |
| certbot_renew | Renew existing ssl certificate/s |

#### Install and manage SSL certifcate/s
1. Make sure you have added your email address in the .env file (CERTBOT_EMAIL=) and your website/domain is working
2. Run "make certbot_init" to register an account with your email address (only needed the first time)
3. Run "make certbot_create", choose the domain/s you want to install a certifcate for and if you want automatic http to https redirects added to your nginx .conf file
4. Simply run "make certbot_renew" to renew your certifcate/s, their lifetime is limited to 3 months
