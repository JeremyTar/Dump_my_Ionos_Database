#!/bin/bash

PATH=saves
AWK_BIN=/usr/bin/awk
DATE_BIN=/usr/bin/date
TEST_BIN=/usr/bin/test
MYSQLDUMP_BIN=/usr/bin/mysqldump

ACTUAL_DATE=$($DATE_BIN +%Y-%m-%d)

while read -r ligne
do

	FOLDERNAME=$(echo $ligne | $AWK_BIN '{print $1}')
	HOST=$(echo $ligne | $AWK_BIN '{print $2}')
	USER=$(echo $ligne | $AWK_BIN  '{print $3}')
	PASSWORD=$(echo $ligne | $AWK_BIN '{print $4}')	
	DBNAME=$(echo $ligne | $AWK_BIN '{print $5}')
	PORT=$(echo $ligne | $AWK_BIN '{print $6}')
	
	echo `$MYSQLDUMP_BIN  --no-tablespaces  --host=$HOST --user=$USER --password="$PASSWORD" $DBNAME > $PATH/$FOLDERNAME/$ACTUAL_DATE.sql`

done < configSave.txt
