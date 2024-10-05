#!/bin/bash

S3_BUCKET_URL="https://techfusion24.s3.ap-south-1.amazonaws.com/index.html"
HTML_FILE="/var/www/html/index.html"

sudo apt update -y
sudo apt install nginx -y

sudo mkdir -p /var/www/html

sudo curl -o $HTML_FILE $S3_BUCKET_URL

sudo chmod 644 $HTML_FILE

sudo systemctl start nginx
sudo systemctl enable nginx

sudo ufw allow 'Nginx HTTP'

sudo systemctl restart nginx

echo "Nginx Web server is up and serving your site on port 80."
