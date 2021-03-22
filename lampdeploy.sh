#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo apt install mysql-server -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo mkdir -p /var/www/html/lamp
cat <<EOF > /etc/apache2/sites-available/lamp.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/lamp
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
sudo a2ensite lamp.conf
sudo a2dissite 000-default
sudo systemctl reload apache2
cat <<EOF > /var/www/html/lamp/index.html
<html>
  <head>
    <title>your_domain website</title>
  </head>
  <body>
    <h1>Hello World!</h1>

    <p>This is the landing page of <strong>your_domain</strong>.</p>
  </body>
</html>
EOF
cat <<EOF > /var/www/html/lamp/info.php
<?php
phpinfo();
EOF
