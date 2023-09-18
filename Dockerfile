FROM node:latest as builder

WORKDIR /app

COPY . .

RUN npm cache clean --force
RUN npm install

RUN npm run build --prod

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/dist/angular-app /usr/share/nginx/html
ENTRYPOINT [ "nginx", "-g" ,"daemon off;" ]