FROM nginx
EXPOSE 80
COPY seaborn-pandas/ /usr/share/nginx/html
