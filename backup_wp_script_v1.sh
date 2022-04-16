#!/bin/bash

###############################################################
#Script name: backup_wp_script_v1.sh
#Description: backup file for wordpress and upload to github
#Args       :
#Author     : Tri BUI
#Email      : bvtri98@gmail.com
###############################################################

# set timestamp to aware the time
timestamp() {
  date +"%d%m%Y_%H%M%S"
}

# create new folder for all file
mkdir backup

# compress source code wordpress
# you can change your path include wordpress source
# /var/www/html/wordpress
echo "##################### Zipping file #####################"
zip -r backup/wordpress_$(timestamp).zip /var/www/html/wordpress

# export sql database
# change user and your password here: -uroot -p'1890'
echo "#####################  Export sql file #####################"
mysqldump -uroot -p'1890' wordpress_db > backup/wordpress_db_$(timestamp).sql
echo "Done."

# backup your config => updating

# git flow
echo "##################### Git upload automation #####################"
git add -A
git commit -am "Regular auto-commit $(timestamp)"
git push origin master
echo "Finish."