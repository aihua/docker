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

ENV LANG=en_US.UTF-8
ENV LC_CTYPE=zh_CN.UTF-8

RUN apt-get -y install  \ 
    bash-completion     \
    wget                \
    openssh-client      \
    build-essential
#    vim                 \
#    curl                \
#    lftp                \
#    p7zip p7zip-rar     \
#    unzip               \
#    mysql-client        \
#    redis-tools         \
#    fonts-arphic-bkai00mp fonts-arphic-bsmi00lp fonts-arphic-gbsn00lp fonts-arphic-gkai00mp fonts-arphic-ukai fonts-arphic-uming 

RUN apt-get clean           \
    && apt-get autoclean    \
    && apt-get autoremove   \
    && rm -rf /var/lib/apt/lists/*

ENV NODE_JS_VERSION 16.13.2

RUN mkdir -p /opt/node.js                                                                               \
    && wget -O - https://nodejs.org/dist/v${NODE_JS_VERSION}/node-v${NODE_JS_VERSION}-linux-x64.tar.xz  \
    | tar -C /opt/node.js -Jxf -                                                                        \
    && mv /opt/node.js/node-v${NODE_JS_VERSION}-linux-x64 /opt/node.js/${NODE_JS_VERSION}               \
    && mkdir -p /opt/node.js/${NODE_JS_VERSION}/etc

COPY etc/profile.d/node.js.sh /etc/profile.d/
COPY etc/npmrc /opt/node.js/${NODE_JS_VERSION}/etc/
