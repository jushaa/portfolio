FROM node:12-alpine as builder

WORKDIR /application

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=builder /application/build /usr/share/nginx/html