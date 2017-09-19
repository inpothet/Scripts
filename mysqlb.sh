#!/bin/bash
# Database credentials
 user="root"
 password="1396"
 host="192.168.1.131"
# Other options
 backup_path="/backup/mysql"
 date=$(date +"%d-%b-%Y")
#Make folder of the day
 mkdir $backup_path/$date
# Set default file permissions
 umask 177
# List all databases on server
databases=`mysql --user=$user --password=$password --host=$host -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`
# Dump database into SQL file
for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump --user=$user --password=$password --host=$host --databases $db > $backup_path/$date/$db-$date.sql
        gzip $backup_path/$date/$db-$date.sql
    fi
done
