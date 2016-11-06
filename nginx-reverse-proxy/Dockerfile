FROM ubuntu:16.04

##################### 常用文件夹准备
RUN mkdir /apps /tools /runner /temp /me
ENV DEBIAN_FRONTEND noninteractive

###########ADD safe user
RUN useradd -m -u 600 safe

##################### 更新系统
RUN apt-get update

##################### 常用工具
RUN apt-get -y install curl wget vim nginx

RUN rm -rf /etc/nginx/sites-available
ADD sites-enabled/default /etc/nginx/sites-available/default
ADD sites-enabled/demo.com /etc/nginx/sites-available/demo.com

RUN mkdir -p /apps/htdocs/public/
ADD index.html /apps/htdocs/public/index.html

EXPOSE 80
WORKDIR /runner
ADD run.sh run.sh
RUN chmod 755 *.sh
CMD ["./run.sh"]




