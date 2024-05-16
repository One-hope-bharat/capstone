FROM httpd:latest

# Copy the application files to the container
COPY . /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80

# Start the Apache server
CMD ["apachectl", "-D", "FOREGROUND"]
