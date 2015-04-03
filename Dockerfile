FROM node:0.10.38

RUN mkdir -p /app \
	&& npm install -g gulp@3.8.11 --unsafe-perm

WORKDIR /app

RUN curl -L https://github.com/TWtablero/tablero/archive/201503161416.tar.gz | tar zx \
	&& find . -maxdepth 1 -type d -name 'tablero*' -exec mv {} tablero \;

#https://github.com/TWtablero/tablero/archive/master.zip
#https://github.com/TWtablero/tablero.git
#https://github.com/TWtablero/tablero/archive/201503161416.tar.gz

WORKDIR /app/tablero
RUN npm install --unsafe-perm
CMD npm start
EXPOSE 8080
