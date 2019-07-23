FROM codercom/code-server:latest
MAINTAINER lmk "ttmk008@gmail.com"
RUN sudo apt-get update && sudo apt-get install -y golang
RUN mkdir -p /home/coder/.local/share/code-server/User/
ADD settings.json /home/coder/.local/share/code-server/User/settings.json
RUN sudo chmod 777 /home/coder/.local/share/code-server/User/settings.json
ADD extensions.tar /home/coder/.local/share/code-server/

