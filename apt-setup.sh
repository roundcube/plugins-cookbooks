#!/bin/bash

apt-get update
apt-get install build-essential ruby ruby-dev curl --yes

export DEBIAN_FRONTEND=noninteractive
apt-get install mariadb-server --yes
apt-get install redis-server --yes
apt-get install nginx --yes

# install and configure php
# see https://panovski.me/install-lemp-nginx-mariadb-and-php-fpm-stack-on-ubuntu-14-04/
export PHPVER=7.0
export PHPINI=/etc/php/7.0/fpm/php.ini

apt-get install php${PHPVER}-fpm php${PHPVER}-cli --yes
apt-get install php${PHPVER}-mysqlnd php${PHPVER}-mcrypt php${PHPVER}-gd php${PHPVER}-intl php${PHPVER}-curl php-pear --yes

cp $PHPINI $PHPINI.orig
sed -i "s/^;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" $PHPINI
sed -i "s/^upload_max_filesize = .*/upload_max_filesize = 64M/" $PHPINI
sed -i "s/^;date.timezone.*/date.timezone = Europe\/Berlin/" $PHPINI
service php${PHPVER}-fpm restart

# install ruby 2.3 + gems + chef
# see http://stackoverflow.com/questions/16222738/how-do-i-install-ruby-2-0-0-correctly-on-ubuntu-12-04
#command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
#curl -sSL -q https://get.rvm.io | bash -s stable --ruby
#source /usr/local/rvm/scripts/rvm
#rvm install 2.3.0
#rvm use 2.3.0
#rvm rubygems latest
gem install chef --no-rdoc --no-ri

