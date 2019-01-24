FROM nginx:latest

# Add repositories containing cerbot for ssl
RUN echo 'deb http://deb.debian.org/debian stretch-backports main contrib non-free' >> /etc/apt/sources.list
RUN echo 'deb-src http://deb.debian.org/debian stretch-backports main contrib non-free' >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
	python-certbot-nginx -t stretch-backports \
    apache2-utils \
    nano

RUN rm /etc/nginx/conf.d/default.conf /var/log/nginx/*.log
RUN touch /var/log/nginx/access.log /var/log/nginx/error.log 

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]