# BUILD FASE
FROM node:12-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# RUN FASE
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html