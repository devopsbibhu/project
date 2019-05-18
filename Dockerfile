FROM centos

RUN yum clean all

RUN yum update -y
 
RUN yum install httpd httpd-tools php php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml -y

EXPOSE  80

WORKDIR /var/www

COPY html .

COPY httpd.conf /etc/httpd/conf/

CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]

