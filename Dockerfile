FROM centos

RUN yum clean all

RUN yum update -y

RUN yum install httpd httpd-tools php php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml -y

EXPOSE  80

WORKDIR /var/www/html

RUN pwd

COPY html .

WORKDIR /etc/httpd/conf/

RUN pwd

COPY httpd.conf .

WORKDIR /etc/httpd/conf.d/

COPY welcome.conf .

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

