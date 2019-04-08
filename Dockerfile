FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf
ARG userid
RUN chown -R $userid:root /var/cache/nginx && \
  mkdir -p /var/www/jimmy && \
  touch /var/www/jimmy/index.html && \
  echo "Hello jim to containers" > /var/www/jimmy/index.html && \
  touch /var/run/nginx.pid && \
  chown -R $userid:root /var/run/nginx.pid
USER $userid
VOLUME /var/www/jimmy
EXPOSE 8081
CMD ["/bin/bash", "-c", "sudo nginx -g 'daemon off"]
