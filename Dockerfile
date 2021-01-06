FROM ubuntu:18.04
MAINTAINER Maxim Antonov <amv@ya.ru>
#Update repo
RUN apt-get update
#Install nginx
RUN apt-get install -y nginx
RUN mkdir /var/www/html/cat
#Global env
ENV nginx_conf_sad /etc/nginx/sites-available/default
ENV www_html /var/www/html/cat
#copy default to sad
COPY default ${nginx_conf_sad}
COPY index.html ${www_html}
RUN mkdir /var/www/html/cat/css && mkdir /var/www/html/cat/js && mkdir /var/www/html/cat/img
#test copy run
COPY css /var/www/html/cat/css
COPY img /var/www/html/cat/img
COPY js /var/www/html/cat/js
RUN chown -R www-data:www-data /var/www/html/cat
#Попытка использовать RUN для изменения конфига, работает
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
#Порты для nginx
EXPOSE 80 443 
