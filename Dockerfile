FROM node:latest as builder

WORKDIR /app

COPY . .
RUN npm install @angular/cli
RUN npm install

RUN npm run build --prod

FROM nginx:alpine
COPY --from=builder /app/dist/angular-app /usr/share/nginx/html
ENTRYPOINT [ "nginx", "-g" ,"daemon off;" ]