sudo apt update
sudo apt install apache2 mariadb-server libapache2-mod-php7.4 -y
sudo apt install php7.4-gd php7.4-mysql php7.4-curl php7.4-mbstring php7.4-intl -y
sudo apt install php7.4-gmp php7.4-bcmath php-imagick php7.4-xml php7.4-zip -y
wget https://download.nextcloud.com/server/releases/nextcloud-23.0.2.zip
wget https://download.nextcloud.com/server/releases/nextcloud-23.0.2.zip.asc
wget https://nextcloud.com/nextcloud.asc
gpg --import nextcloud.asc
gpg --verify nextcloud-23.0.2.zip.asc nextcloud-23.0.2.zip
unzip nextcloud-23.0.2.zip
cp -r nextcloud /var/www/nextcloud1/
cd /etc/apache2/sites-available/
touch nextcloud1.conf
echo '<VirtualHost *:80>
  DocumentRoot /var/www/nextcloud1/
  ServerName  nextcloud.xrtekstitys.fi

  <Directory /var/www/nextcloud1/>
    Require all granted
    AllowOverride All
    Options FollowSymLinks MultiViews

    <IfModule mod_dav.c>
      Dav off
    </IfModule>
  </Directory>
</VirtualHost>' > nextcloud.conf
a2ensite nextcloud.conf
a2enmod rewrite
a2enmod headers
a2enmod env
a2enmod dir
a2enmod mime
service apache2 restart
chown -R www-data:www-data /var/www/nextcloud1/
cd /var/www/nextcloud1/
sudo -u www-data php occ  maintenance:install --database-name="nextcloud1" --database-user="nextcloud1" --database-pass="N3XTC0UD15B3ST" --admin-user="nextcloud" --admin-pass="6WF_24pk).Ve67`Z" --data-dir="/var/www/nextcloud1/data"
