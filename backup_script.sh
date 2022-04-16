#!/bin/sh

# set timestamp to aware the time
timestamp() {
  date +"%d%m%Y_%H%M%S"
}

# create new folder for all file
mkdir backup

# compress source code wordpress
echo "########################## Zipping file #########################"
zip -r backup/wordpress_$(timestamp).zip /var/www/html/wordpress
#export sql database
echo "########################## Export sql file #########################"
mysqldump -uroot -p'1890' wordpress_db > backup/wordpress_db_$(timestamp).sql


# git flow
echo "########################## Git automation #########################"
git add -A
git commit -am "Regular auto-commit $(timestamp)"
git push origin master