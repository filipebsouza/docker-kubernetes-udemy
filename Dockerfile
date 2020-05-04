FROM node:alpine as builder

WORKDIR '/app'

COPY ./frontend/package*.json ./
RUN npm install --silent

COPY ./frontend ./
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

