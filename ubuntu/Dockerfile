FROM ubuntu

ENV UBUNTU_VERSION 20.04

COPY etc/environment /etc/environment
COPY etc/default/locale /etc/default/locale

COPY etc/apt/apt.conf.d/01translate /etc/apt/apt.conf.d/
COPY etc/apt/sources-${UBUNTU_VERSION}.list /etc/apt/sources.list

COPY etc/skel/.vimrc /etc/skel/.vimrc

RUN mkdir -p /var/lib/locales/supported.d
COPY var/lib/locales/supported.d/ /var/lib/locales/supported.d/

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install locales  \
    && locale-gen               \
    && mv /etc/profile.d/01-locale-fix.sh /etc/profile.d/01-locale-fix.sh.init

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
RUN apt-get -y install tzdata

# ENV LANG=en_US.UTF-8
# ENV LC_CTYPE=zh_CN.UTF-8

# RUN apt-get -y install  \ 
#    bash-completion     \
#    build-essential     \
#    vim                 \
#    wget                \
#    curl                \
#    lftp                \
#    p7zip p7zip-rar     \
#    unzip               \
#    openssh-client      \
#    mysql-client        \
#    redis-tools         \
#    fonts-arphic-bkai00mp fonts-arphic-bsmi00lp fonts-arphic-gbsn00lp fonts-arphic-gkai00mp fonts-arphic-ukai fonts-arphic-uming 
