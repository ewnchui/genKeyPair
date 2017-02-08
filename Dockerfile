FROM node

ENV VER=${VER:-master} \
    REPO=https://github.com/ewnchui/genKeyPair \
    APP=/usr/src/app

RUN apt-get update \  
&&  apt-get -y install git \
&&  apt-get clean \
&&  git clone -b $VER $REPO $APP

WORKDIR /usr/src/app

RUN npm install \
&&  node_modules/.bin/bower install --allow-root
	
EXPOSE 1337

ENTRYPOINT ./entrypoint.sh
