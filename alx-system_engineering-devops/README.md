The MySQL server provides a database management system with querying and connectivity capabilities, as well as the ability to have excellent data structure and integration with many different platforms.

Needed Knowledge
	What is a primary-replica cluster
	MySQL primary replica setup
	Build a robust database backup strategy
	mysqldump

Learning Objectives
	What is the main role of a database
	What is a database replica
	What is the purpose of a database replica
	Why database backups need to be stored in different physical locations
	What operation should you regularly perform to make sure that your database backup strategy actually works
Project Requirements
	Allowed editors: vi, vim, emacs
	All your files will be interpreted on Ubuntu 16.04 LTS
	All your files should end with a new line
	A README.md file, at the root of the folder of the project, is mandatory
	All your Bash script files must be executable
	Your Bash script must pass Shellcheck without any error
The first line of all your Bash scripts should be exactly #!/usr/bin/env bash
The second line of all your Bash scripts should be a comment explaining what is the script doing

Installation Guide for mysql 5.7.*
https://dev.mysql.com/doc/refman/5.7/en/checking-gpg-signature.html
First go to site dev.mysql.com and copy the PGP PUBLIC KEY just immediately under the Notice section to your clipboard.
Create a new file in your terminal with a signature.key extension and paste the PGP PUB KEY copied to clipboard.
Then do the following
sudo apt list | grep mysql-server

adding the key to application management
sudo apt-key add signature.key
update
sudo apt update
	OK
// apt-cache policy mysql-client mysql-community-server mysql-server
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C
	# adding it to the apt repo
sudo sh -c 'echo "deb http://repo.mysql.com/apt/ubuntu bionic mysql-5.7" >> /etc/apt/sources.list.d/mysql.list'
	# updating the apt repo to add the url i added earlier
sudo apt-get update
mysql --version
	# now check your available versions
sudo apt-cache policy mysql-server

# Now am installing mysql 5.7.*
	$ sudo apt-get install -f mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7* -y
	Project Task
Creating a user and Granting Priviledges in mysql
	$ mysql -root -p
	Password:	/* Type root password
	mysql> CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
	mysql> GRANT GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
	mysql> FLUSH PRIVILEGES;
Creating Database, Tables and adding Data to the Tables
	mysql> CREATE DATABASE db_name_;
	-- To verify if db is created
	mysql> SHOW DATABASES;
	mysql> USE db_name;
	mysql> CREATE TABLE table_name (
	-> col_1 data_type,
	-> col_2 data_type);
-- continue adding more coloums to your taste for me i just added two coloumns
	mysql> INSERT INTO table_name VALUES (val_1, val_2);
-- Verify if data was added succesfully do
	mysql> SELECT col_1, col_2 FROM tb_name;
	Setting Up MySQL Replication
	First create replication user and grant replication priviledge ( best practice).
	mysql> CREATE USER 'replica_user'@'%' IDENTIFIED BY 'replica_user_pwd';
	mysql> GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
	mysql> FLUSH PRIVILEGES;
-- to verify
	mysql> SELECT user, Repl_slave_priv FROM mysql.user;
	mysql> exit
Next up you go to the /etc/mysql/mysql.conf.d/mysqld.cnf and comment the bind address and then add this lines to it
	# By default we only accept connections from localhost
	# bind-address = 127.0.0.1
	server-id = 1
	log_bin = /var/log/mysql/mysql-bin.log
	binlog_do_db = db_name
	Then you enable incoming connection to port 3306 and restart mysql-server
	$ sudo ufw allow from 'replica_server_ip' to any port 3306
	$ sudo service mysql restart
Now log back in to mysql-server to lock db and prepare binary file for replication.
	$ mysql -uroot -p
	password:
	mysql>
	mysql> FLUSH TABLES WITH READ LOCK;
	mysql> SHOW MASTER STATUS;
