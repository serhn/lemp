# DOCKER, Linux Nginx PHP MYSQL(LEMP), phpmyadmin, mailcatcher

A set of scripts is designed to quickly deploy the PHP-FRM development environment (different versions at 5.6 and 7.1 now), NGINX, MYSQL 5.7

## Installation and Startup

You must have DOCKER installed on your computer, these scripts were tested on Linux and MAС


BEGIN INSTALLING:
```sh
git clone https://github.com/serhn/lemp.git
cd lemp
./restart_all.sh
```
READY!)


#### PORTS:

MYSQL

3306 - (default root password: testo)
<http://localhost:8080> 


NGNIX

<http://localhost:80> - with php56,php71,php71dev


MAILCATCHER

<http://localhost:1080> - web interface used in php71dev to send mail virtual SMTP, emails sent by the function mail() can be seen here


SERVER: mailcatcher 

PORT: 1025


#### Directories will be created:

./mysql - here is the mysql database(you can copy this directory for backup and transfer to another computer)

./ngnix/conf.d - here are the configurations of nginx of your sites

./ngnix/sites - there are sites

./ngnix/log - there are logs


#### To quickly create virtual hosts:

./virtual.sh (HOST) (php56 php71 php71dev) [addhost - optional for add /etc/hosts]


php56 - version php 5.6 can be used in production

php71 - version of php 7.1 can be used in production

php71dev - ersion for development, in php.ini turns mail into mailcatcher, additional packages are installed for development composer, git, node(v10.x), vim, mysql-client and other, for detals see Dockerfile 

### Example:
```sh
./virtual.sh test_site php71dev addhost
```

1. the root password will be requested to add

⋅⋅⋅/etc/hosts 

⋅⋅⋅127.0.0.1	test_site


2. will be created for nginx configuration

⋅⋅⋅./ngnix/conf.d/test_site.conf

⋅⋅⋅if something is wrong in this file, edit it, and then restart nginx

⋅⋅⋅./run_30ngnix.sh

3. create directories for the site and file index.php

⋅⋅⋅./ngnix/sites/test_site/public/index.php

4. GO GO GO http://test_site/
