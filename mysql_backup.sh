#!/bin/bash
if [ ${EUID:-${UID}} -ne 0 ];then
	echo "usage: sudo $0"
fi
mkdir -p /backup/db
echo "show databases;"|mysql |while read line
do
	mysqldump --single-transaction $line >/backup/db/$line.sql
done
mysqldump --single-transaction --all-databases > /backup/db/all.sql
