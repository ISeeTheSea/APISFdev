#! /bin/bash
set -e

# Available dbs
declare -a enabled_envs=('stock')

# Database prefix
db_prefix="apisf_"

echo "Checking databases..."

# Get list of existent databases and exclude them from the init process
for db in $(mysql -uroot -p$MYSQL_ROOT_PASSWORD <<<"show databases like '$db_prefix%'")
do
	echo "Database $db_prefix$db already exists. Excluded from init process."
	enabled_envs=( ${enabled_envs[@]/${db: -2}} )
done

echo "Initialization started"
# Init databases
for db  in "${enabled_envs[@]}"
do
	echo "Creating database $db_prefix$db"
	mysql --default-character-set=utf8 -uroot -p$MYSQL_ROOT_PASSWORD <<<"create database $db_prefix$db;"

	echo "Applying common schema"
	mysql --default-character-set=utf8 -uroot -p$MYSQL_ROOT_PASSWORD "$db_prefix$db" < /opt/common-schema.sql

	#echo "Applying custom schema"
	#mysql --default-character-set=utf8 -uroot -p$MYSQL_ROOT_PASSWORD "$db_prefix$db" < /opt/$db-custom-schema.sql

	echo "Inserting common data"
	mysql --default-character-set=utf8 -uroot -p$MYSQL_ROOT_PASSWORD "$db_prefix$db" < /opt/common-data.sql

	#echo "Inserting custom data"
    #mysql --default-character-set=utf8 -uroot -p$MYSQL_ROOT_PASSWORD "$db_prefix$db" < /opt/$db-custom-data.sql
done
echo "Initialization done."

unset enabled_envs
