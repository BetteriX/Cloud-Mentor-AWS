FROM alpine:latest

RUN apk update && apk add --no-cache apache2

RUN echo "cmtr-ook9q7ho" > /var/www/localhost/htdocs/index.html

EXPOSE 80

CMD [ "httpd", "-D", "FOREGROUND" ]