FROM alpine
MAINTAINER quinn <qjpoo@163.com>

# Install root filesystem
#ADD ./rootfs /

# Install base packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && cat /etc/apk/repositories \
    && apk update \
    && apk add curl bash tree tzdata \
    && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo -ne "Alpine Linux image. (`uname -rsv`)\n" >> /root/.built \
    &&  rm  -rf  /var/cache/apk/ * \
    &&  rm  -rf  /root/ .cache \
    &&  rm  -rf  /tmp/ *
# Define bash as default command
CMD ["/bin/bash"]
