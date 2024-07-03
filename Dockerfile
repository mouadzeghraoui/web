# Use the official NGINX image as a parent image
FROM nginx:stable-alpine

# Remove the default NGINX configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy a new configuration file from the current directory
COPY nginx.conf /etc/nginx/conf.d/

# Copy the HTML file to the appropriate location
COPY index.html /usr/share/nginx/html/

# Expose port 8080
EXPOSE 8080

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]