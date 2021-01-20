FROM httpd:2.4
COPY code/*.html /usr/local/apache2/htdocs/
EXPOSE 80


