FROM node:alpine

# Diretório da aplição dentro do container.
# Senão existir vai criar
WORKDIR /usr/app

# Copiar o arquivo package.json
# Fazendo isso, ele só vai copiar package.json e reinstalar as dependências
# Se houver mudanças nas dependências.
COPY ./package.json ./
RUN npm install

# Depois ele copia o restante
COPY ./ ./

CMD [ "npm", "start" ]