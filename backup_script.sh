#!/bin/sh

# set timestamp to aware the time
timestamp() {
  date +"%d%m%Y_%H%M%S"
}

# create folder include all file
mkdir wp_$(timestamp)

# compress source code wordpress
echo "########################## Zipping file #########################"
zip -r wp_$(timestamp)/wordpress.zip /var/www/html/wordpress
#export sql database
echo "########################## Export sql file #########################"
mysqldump -uroot -p'1890' wordpress_db > wp_$(timestamp)/wordpress_db.sql


# git flow
echo "########################## Git automation #########################"
git add -A
git commit -am "Regular auto-commit $(timestamp)"
git push origin master