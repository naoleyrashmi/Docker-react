FROM node:alpine as intermediate-service

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build


FROM nginx

COPY --from=intermediate-service /app/build /usr/share/nginx/html


