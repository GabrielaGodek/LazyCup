FROM node:18-alpine

WORKDIR /app/backend

COPY package*.json ./
COPY . /app/backend

RUN npm install \
    && npm run build

CMD ["npm", "start"]

EXPOSE 3030