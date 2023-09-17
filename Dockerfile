ARG WORK_DIR=/build

FROM node:latest-alpine as builder

ARG WORK_DIR
ENV PATH ${WORK_DIR}/node_modules/.bin:$PATH

RUN mkdir ${WORK_DIR}
WORKDIR ${WORK_DIR}

COPY package.json ${WORK_DIR}
COPY package-lock.json ${WORK_DIR}

RUN npm install @angular/cli
RUN npm install

COPY . ${WORK_DIR}

RUN ng build --prod

FROM nginx:latest-alpine

ARG WORK_DIR

COPY --from=builder ${WORK_DIR}/dist/angular-crash /usr/share/nginx/html

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 85