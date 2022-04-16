#!/bin/sh

timestamp() {
  date +"%H:%M:%S_%d/%m/%Y"
}

zip -r wordpress_$(timestamp).zip /var/www/html/wordpress

mysql -uroot -p'1890' wordpress_db > wordpress_$(timestamp).sql

git add --all
git commit -am "Regular auto-commit $(timestamp)"
git push origin master
