FROM node:18-alpine

WORKDIR /app/frontend

COPY package*.json ./
COPY . /app/frontend

RUN npm install \
    && npm run build

CMD ["npm", "start"]

EXPOSE 5173