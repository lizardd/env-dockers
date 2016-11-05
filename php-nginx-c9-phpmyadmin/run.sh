#!/bin/bash

## 关闭nginx的守护进程执行，防止docker启动后，自动停止的问题
# echo "daemon off;" >> /etc/nginx/nginx.conf 
service php7.0-fpm start && nginx

pm2 start /tools/cloud9/server.js --no-daemon --name cloud9 -- --packed false -p 81 -l 0.0.0.0 -a ${C9_AUTH:-user:pass} -w /apps
#packed 是压缩的意思 但是一旦压缩好像会出现编辑器无法编辑的问题，在谷歌浏览器里面。所以可以改成false


