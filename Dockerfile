FROM nginx:alpine

COPY ./default.conf /etc/nginx/conf.d/default.conf

COPY ./includes/ /etc/nginx/includes/

RUN echo -e "\n\
stream { \n\
  log_format basic '\$remote_addr [\$time_local] ' \n\
                   '\$protocol \$status \$bytes_sent \$bytes_received ' \n\
                   '\$session_time'; \n\
  server { \n\
    listen 8081; \n\
    resolver 127.0.0.11 [::1]; \n\
    proxy_pass \$ssl_preread_server_name:443; \n\
    ssl_preread on; \n\
    access_log /var/log/nginx/stream_access.log basic; \n\
    error_log /var/log/nginx/stream_error.log error; \n\
  } \n\
}" >> /etc/nginx/nginx.conf
