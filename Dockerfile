# Build Section
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# Built files will be in /app/build


# Run Section
FROM nginx:alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
