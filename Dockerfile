FROM node:carbon-alpine
RUN mkdir /my_app
COPY index.js /my_app
COPY package.json /my_app
COPY package-lock.json /my_app
WORKDIR /my_app
RUN npm install
EXPOSE 3000
CMD [ "node", "index.js" ]
