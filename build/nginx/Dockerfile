FROM nginx:latest

# Add repositories containing cerbot for ssl
RUN echo 'deb http://deb.debian.org/debian stretch-backports main contrib non-free' >> /etc/apt/sources.list
RUN echo 'deb-src http://deb.debian.org/debian stretch-backports main contrib non-free' >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y nano

RUN rm /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]