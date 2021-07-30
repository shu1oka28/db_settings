#!/bin/bash
if [ ${EUID:-${UID}} -ne 0 ];then
	echo "usage: sudo $0"
fi
systemctl status mysqld || systemctl start mysqld ||true
systemctl status redis || systemctl start redis ||true
