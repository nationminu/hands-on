# mariadb 설치

1. mariadb 설치 
```
# sudo yum -y install mariadb-server

# systemctl start mariadb

# systemctl status mariadb 
● mariadb.service - MariaDB database server
   Loaded: loaded (/usr/lib/systemd/system/mariadb.service; disabled; vendor preset: disabled)
   Active: active (running) since Thu 2020-10-08 21:50:05 EDT; 3s ago
  Process: 3369 ExecStartPost=/usr/libexec/mariadb-wait-ready $MAINPID (code=exited, status=0/SUCCESS)
  Process: 3286 ExecStartPre=/usr/libexec/mariadb-prepare-db-dir %n (code=exited, status=0/SUCCESS)
 Main PID: 3368 (mysqld_safe)
   CGroup: /system.slice/mariadb.service
           ├─3368 /bin/sh /usr/bin/mysqld_safe --basedir=/usr
           └─3531 /usr/libexec/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib64/mysql/plugin --log-error=/var/log/mariadb/...

Oct 08 21:50:03 hands-on mariadb-prepare-db-dir[3286]: MySQL manual for more instructions.
Oct 08 21:50:03 hands-on mariadb-prepare-db-dir[3286]: Please report any problems at http://mariadb.org/jira
Oct 08 21:50:03 hands-on mariadb-prepare-db-dir[3286]: The latest information about MariaDB is available at http://mariadb.org/.
Oct 08 21:50:03 hands-on mariadb-prepare-db-dir[3286]: You can find additional information about the MySQL part at:
Oct 08 21:50:03 hands-on mariadb-prepare-db-dir[3286]: http://dev.mysql.com
Oct 08 21:50:03 hands-on mariadb-prepare-db-dir[3286]: Consider joining MariaDB's strong and vibrant community:
Oct 08 21:50:03 hands-on mariadb-prepare-db-dir[3286]: https://mariadb.org/get-involved/
Oct 08 21:50:03 hands-on mysqld_safe[3368]: 201008 21:50:03 mysqld_safe Logging to '/var/log/mariadb/mariadb.log'.
Oct 08 21:50:03 hands-on mysqld_safe[3368]: 201008 21:50:03 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql
Oct 08 21:50:05 hands-on systemd[1]: Started MariaDB database server.
```


2. mariadb 접속
```
$ mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 5.5.65-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
```

3. database 생성 및 데이터 입력
handson 데이터베이스를 생성하고 handson 유저의 권한으로 접속할수 있게 설정한다.
```
MariaDB [(none)]> CREATE DATABASE handson;
Query OK, 1 row affected (0.00 sec)

MariaDB [(none)]> create user 'handson'@'localhost' identified by '1234';
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> grant all privileges on handson.* to 'handson'@'localhost';
Query OK, 0 rows affected (0.00 sec)

```

4. handson 접속 테스트
```
# mysql -u handson -p handson
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 5
Server version: 5.5.65-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement
```


5. handson 데이터 베이스에 데이터 넣기
```
wget 

```