FROM nginx:latest

RUN apt-get update && apt-get install -y \
    nano
RUN rm /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]