#!/bin/sh

cat .setup 2> /dev/null

if [ $? -ne 0 ]; then
	echo "Setting up MariaDB...";

	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
	sed -i "s|#bind-address\s*=*.|bind-address=0.0.0.0\nport=3306|g" /etc/my.cnf.d/mariadb-server.cnf

	# configure mariadb
	if ! mysqladmin --wait=30 ping; then
		echo "MariaDB is not available";
		exit 1;
	fi

	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
	pkill mariadb
	touch .setup;
	echo "Done.";
fi

usr/bin/mysqld_safe --datadir='/var/lib/mysql'

