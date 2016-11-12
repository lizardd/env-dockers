FROM ubuntu:16.04
MAINTAINER lmk "ttmk008@gmail.com"
##################### 常用文件夹准备
RUN mkdir -p /apps/logs /tools /runner /temp /me
ENV DEBIAN_FRONTEND noninteractive
#VOLUME ["/apps"]
###########ADD safe user
RUN useradd -m -u 600 safe

##################### 更新系统
RUN apt-get update

##################### 常用工具
RUN apt-get -y install curl wget vim nginx git

RUN rm -rf /etc/nginx/sites-available
ADD sites-enabled/default /etc/nginx/sites-available/default

RUN mkdir -p /apps/htdocs/public/
ADD index.html /apps/htdocs/public/index.html
RUN echo "this container is used for front-end" > /apps/htdocs/public/index.html
RUN ln -s /etc/nginx/sites-available/demo.com /etc/nginx/sites-enabled/demo.com

##############install nvm
ENV HOME /root
ENV PATH /root/.nvm/versions/node/v6.9.1/bin:$PATH
RUN git clone https://github.com/creationix/nvm.git $HOME/.nvm
RUN pwd $HOME/.nvm/
##############install node
RUN bash -c '. $HOME/.nvm/nvm.sh; nvm install 6.9.1 && nvm alias default 6.9.1'
#########install pm2
Run npm install pm2 -g

EXPOSE 80
WORKDIR /runner
ADD run.sh run.sh
RUN chmod 755 *.sh
CMD ["./run.sh"]


