FROM node:alpine
WORKDIR /app
COPY ./package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# /app/build <-- all the stuff we care
# FROM finaliza o outro bloco ou fase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
# ENGINE X START ALONE from the img