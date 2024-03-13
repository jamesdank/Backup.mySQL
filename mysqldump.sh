#!/bin/bash

db_username="root"

db_password=""

destination="path/to/backup/dir"

date="$(date +%Y-%m-%d_%H%M%S)"

mysqldump=$(whereis mysqldump | sed 's|mysqldump: ||g')

mkdir -p "$destination/backup-$date"

# Backup Databases
declare -a databases=(
    'database1'
    'database2'
    'database3'
    );

# Create Database Backups
for db in ${databases[@]}
do
    $mysqldump -u $db_username -p "--password=$db_password" "$db" > "$destination/backup-$date/db-$db.sql"

    echo "$db" Database Backup Created.
done
