FROM ubuntu:18.04
MAINTAINER Maxim Antonov <amv@ya.ru>
#Update repo
RUN apt-get update
#Install nginx
RUN apt-get install -y nginx
#Global env
ENV nginx_conf_sad /etc/nginx/sites-available/default
ENV www_html /var/www/html
#copy default to sad
COPY default ${nginx_conf}
COPY index.html ${www_html}
RUN mkdir /var/www/html/css && mkdir /var/www/html/js && mkdir /var/www/html/img
#test copy run
COPY css /var/www/html/css
COPY img /var/www/html/img
COPY js /var/www/html/js
RUN chown -R www-data:www-data /var/www/html && chmod +x /var/www/html/index.html
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
#Порты для nginx
EXPOSE 80 443 
