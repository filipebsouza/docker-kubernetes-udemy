FROM node:alpine

WORKDIR '/app'

COPY ./frontend/package*.json ./
RUN npm install --silent

COPY ./frontend .
RUN npm install react-scripts@3.4.1 -g --silent
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

