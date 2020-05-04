FROM node:alpine as builder

WORKDIR '/app'

ENV PATH /app/node_modules/.bin:$PATH

COPY ./frontend/package*.json ./
RUN npm install
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

COPY ./frontend ./
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

