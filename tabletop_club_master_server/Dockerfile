FROM node:15
# replace this with your application's default port
EXPOSE 9080
WORKDIR /usr/src/app
COPY . .
RUN npm install -g && npm ci && npm run build --if-present && npm test
ENTRYPOINT ["node", "server.js"]
