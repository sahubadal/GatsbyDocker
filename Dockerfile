FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN yarn install && yarn build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/public .
ENTRYPOINT ["nginx", "-g", "daemon off;"]
