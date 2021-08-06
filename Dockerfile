# FROM node:alpine as builder
FROM node:alpine

WORKDIR '/app'

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN yarn build


FROM nginx 
EXPOSE 80
# COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html
