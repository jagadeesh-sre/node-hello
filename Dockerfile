#Stage 1
FROM node:18 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

#Stage 2
FROM node:18-slim

WORKDIR /app

COPY --from=build /app ./

RUN npm ci --only=production

EXPOSE 3000

CMD ["npm", "start"]
