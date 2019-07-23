FROM ubuntu:18.10
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
RUN apt-get -y install zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN chsh -s /bin/zsh
########C9

##############install nvm
ENV HOME /root
ENV PATH /root/.nvm/versions/node/v10.15.3/bin:$PATH
RUN git clone https://github.com/creationix/nvm.git $HOME/.nvm
RUN pwd $HOME/.nvm/
##############install node
RUN bash -c '. $HOME/.nvm/nvm.sh; nvm install 10.15.3 && nvm alias default 10.15.3'
#########install pm2
Run npm install pm2 -g
########C9
###prepare
RUN apt-get -y install gcc make build-essential
RUN echo 'update C9'
#RUN cd /tools && git clone https://github.com/c9/core.git cloud9
RUN cd /root && git clone https://github.com/c9/core.git c9
#WORKDIR /tools/cloud9
WORKDIR /root/c9
RUN git pull origin master
#RUN git pull origin c9
RUN chmod 755 scripts/*.sh
RUN apt-get install -y locales-all
RUN scripts/install-sdk.sh

# Tweak standlone.js conf
RUN sed -i -e 's_127.0.0.1_0.0.0.0_g' /root/c9/configs/standalone.js


EXPOSE 22 80 81 82

WORKDIR /runner
ADD run.sh run.sh
RUN chmod 775 *.sh
CMD ["./run.sh"]  


