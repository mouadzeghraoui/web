FROM nginx:stable-alpine

# Remove the default NGINX configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy a new configuration file from the current directory
COPY nginx.conf /etc/nginx/conf.d/

# Copy the HTML file to the appropriate location
COPY index.html /usr/share/nginx/html/

# Create necessary directories and set permissions
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx \
    && chmod -R g+rwx /var/cache/nginx /var/run /var/log/nginx /var/lib/nginx /etc/nginx /usr/share/nginx/html

# Use a non-root user
USER 1001

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
