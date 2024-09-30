FROM nginx:alpine

COPY nginx.conf /etc/nginx/templates/nginx.conf.template

RUN apk add --no-cache gettext

CMD envsubst '$TARGET_URL' < /etc/nginx/templates/nginx.conf.template > /etc/nginx/nginx.conf && \
    nginx -g 'daemon off;'
