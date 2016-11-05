FROM ubuntu:16.04
########################base install###########################################
##################### 常用文件夹准备
RUN mkdir /apps /tools /runner /temp 
ENV DEBIAN_FRONTEND noninteractive
###########ADD safe user
RUN useradd -m -u 600 safe

##################### 更新系统
RUN apt-get update 

##################### 常用工具
RUN apt-get -y install curl wget vim openssl unzip python git
#################### install ssh
RUN apt-get -y install openssh-server
##################### install oh-my-zsh
#RUN apt-get -y install zsh
#RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
#RUN chsh -s /bin/zsh
#######################end base install############################################

#####################nginx+php7################################
RUN apt-get -y install php7.0-fpm php7.0-cli php7.0-mysql php7.0-mcrypt php7.0-gd php-pear php7.0-curl php7.0-sqlite php7.0-mbstring 
#php-apc
RUN phpenmod mcrypt
#RUN apt-get -y upgrade
######### intall nginx and php
RUN apt-get -y install nginx 
ADD etc/php.ini /tools/php.ini
RUN cat /tools/php.ini > /etc/php/7.0/fpm/php.ini
RUN rm /tools/php.ini
RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php/7.0/fpm/php.ini
ADD etc/vhost/default.conf /etc/nginx/sites-available/default
RUN mkdir -p /apps/logs/nginx

#安装phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.6.4/phpMyAdmin-4.6.4-all-languages.tar.gz -O - | tar -xz
RUN mv phpMyAdmin* /phpmyadmin
ADD etc/phpmyadmin.config.inc.php /phpmyadmin/config.inc.php
ADD etc/vhost/phpmyadmin.conf /etc/nginx/sites-available/phpmyadmin
RUN ln -s /etc/nginx/sites-available/phpmyadmin /etc/nginx/sites-enabled/phpmyadmin

############install composer and laravel
RUN  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

##################### install oh-my-zsh
RUN apt-get -y install zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN chsh -s /bin/zsh
##############install nvm
ENV HOME /root
ENV PATH /root/.nvm/versions/node/v6.9.1/bin:$PATH
RUN git clone https://github.com/creationix/nvm.git $HOME/.nvm
RUN pwd $HOME/.nvm/
##############install node
RUN bash -c '. $HOME/.nvm/nvm.sh; nvm install 6.9.1 && nvm alias default 6.9.1'
#########install pm2
Run npm install pm2 -g
########C9
###prepare
RUN apt-get -y install gcc make build-essential
RUN echo 'update C9'
RUN cd /tools && git clone https://github.com/c9/core.git cloud9
WORKDIR /tools/cloud9
RUN git pull origin master
#RUN git pull origin c9
RUN chmod 755 scripts/*.sh
RUN scripts/install-sdk.sh

# Tweak standlone.js conf
RUN sed -i -e 's_127.0.0.1_0.0.0.0_g' /tools/cloud9/configs/standalone.js


EXPOSE 22 80 81 82

WORKDIR /runner
ADD run.sh run.sh
RUN chmod 775 *.sh
CMD ["./run.sh"]  


