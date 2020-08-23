FROM node:alpine as builder

WORKDIR '/app'

ENV PATH /app/node_modules/.bin:$PATH

COPY ./package.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

COPY . .
RUN npm run build

FROM nginx:alpine
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
