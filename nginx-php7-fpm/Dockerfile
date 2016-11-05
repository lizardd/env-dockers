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
RUN apt-get -y install php7.0-fpm 
RUN apt-get -y install php7.0-cli 
RUN apt-get -y install php7.0-mysql 
RUN apt-get -y install php7.0-mcrypt
RUN apt-get -y install php7.0-gd php-pear php7.0-curl php7.0-sqlite 
RUN apt-get -y install php7.0-mbstring
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

EXPOSE 22 80 

WORKDIR /runner
ADD run.sh run.sh
RUN chmod 775 *.sh
CMD ["./run.sh"]  


