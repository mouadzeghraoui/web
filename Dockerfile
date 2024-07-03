FROM nginx:stable-alpine

# Remove the default NGINX configuration files
RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/nginx.conf

# Copy the custom NGINX configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the server block configuration
COPY default.conf /etc/nginx/conf.d/

# Copy the HTML file to the appropriate location
COPY index.html /usr/share/nginx/html/

# Create necessary directories and set permissions
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx \
    && chmod -R g+rwx /var/cache/nginx /var/run /var/log/nginx /etc/nginx /usr/share/nginx/html

# Use a non-root user
USER 1001

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
