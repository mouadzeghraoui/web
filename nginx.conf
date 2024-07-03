FROM nginx:stable-alpine

# Remove the default NGINX configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy the server block configuration
COPY default.conf /etc/nginx/conf.d/

# Copy the HTML file to the appropriate location
COPY index.html /usr/share/nginx/html/

# Create necessary directories and set permissions
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx \
    && chmod -R g+rwx /var/cache/nginx /var/run /var/log/nginx /etc/nginx /usr/share/nginx/html

# Modify main NGINX configuration
RUN sed -i 's/user  nginx;//g' /etc/nginx/nginx.conf \
    && sed -i 's,listen       80;,listen       8080;,' /etc/nginx/conf.d/default.conf \
    && sed -i 's,/var/run/nginx.pid,/tmp/nginx.pid,' /etc/nginx/nginx.conf \
    && sed -i '/^http {/a \    client_body_temp_path /tmp/client_temp;\n    proxy_temp_path       /tmp/proxy_temp_path;\n    fastcgi_temp_path     /tmp/fastcgi_temp;\n    uwsgi_temp_path       /tmp/uwsgi_temp;\n    scgi_temp_path        /tmp/scgi_temp;\n' /etc/nginx/nginx.conf

# Use a non-root user
USER 1001

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
