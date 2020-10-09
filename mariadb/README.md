# mariadb 설치

## 1. mariadb 설치 
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
 
## 2. mariadb 접속
```
$ mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 5.5.65-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
```

## 3. database 생성 및 데이터 입력
handson 데이터베이스를 생성하고 handson 유저의 권한으로 접속할수 있게 설정한다.
```
MariaDB [(none)]> CREATE DATABASE handson;
Query OK, 1 row affected (0.00 sec)

MariaDB [(none)]> create user 'handson'@'localhost' identified by '1234';
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> grant all privileges on handson.* to 'handson'@'localhost';
Query OK, 0 rows affected (0.00 sec)

```

## 4. handson 접속 테스트
```
# mysql -u handson -p handson
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 5
Server version: 5.5.65-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement
```

## 5. handson 데이터 베이스에 데이터 넣기
데이터 스키마를 다운로드하고 handson 데이터베이스에 데이터를 넣는다.
```
# wget https://raw.githubusercontent.com/nationminu/hands-on/main/mariadb/data.sql

# mysql -u handson -p handson < data.sql
Enter password: 
```

## 6. handson 데이터 베이스 접속후 데이터 확인하기
- SQL 사용법 
```
# mysql -u handson -p handson
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 5
Server version: 5.5.65-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement

## 1. 데이터베이스 목록 확인하기
MariaDB [(none)]> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| handson            |
| test               |
+--------------------+
3 rows in set (0.00 sec)

## 2. 데이터베이스 사용하기
MariaDB [(none)]> use handson
Database changed

MariaDB [handson]> 

## 3. 데이터베이스내 테이블 목록 확인하기
MariaDB [handson]> show tables;
+-------------------+
| Tables_in_handson |
+-------------------+
| authors           |
| posts             |
+-------------------+
2 rows in set (0.00 sec)

## 4. 테이블 데이터 확인하기
MariaDB [handson]> select * from posts;
...
|   1 |         1 | Rerum iste recusandae maiores tempora.                                    | Sed maxime sint rerum. Maxime magnam saepe sit quod et est voluptate. Qui neque ut perferendis rerum labore ea. Quod est eum consequatur sed explicabo omnis.                                                                                                                     | Cupiditate nihil et rerum molestias et cum natus. Et ipsum hic quasi
...
100 rows in set (0.00 sec)


## 5. 테이블 만들기
MariaDB [handson]> create table mytable(id int(11) not null primary key auto_increment, name char(20),age int,class char(5));
Query OK, 0 rows affected (0.00 sec)
  
MariaDB [handson]> desc mytable;
+-------+----------+------+-----+---------+----------------+
| Field | Type     | Null | Key | Default | Extra          |
+-------+----------+------+-----+---------+----------------+
| id    | int(11)  | NO   | PRI | NULL    | auto_increment |
| name  | char(20) | YES  |     | NULL    |                |
| age   | int(11)  | YES  |     | NULL    |                |
| class | char(5)  | YES  |     | NULL    |                |
+-------+----------+------+-----+---------+----------------+
4 rows in set (0.00 sec)



## 6. 테이블에 데이터 입력하기

MariaDB [handson]> desc mytable;
MariaDB [handson]> insert into mytable(name,age,class) values('Ayana Ferry','17','1-1');
Query OK, 1 row affected, 0 warnings (0.00 sec)

MariaDB [handson]> select * from mytable;
+----+-------------+------+-------+
| id | name        | age  | class |
+----+-------------+------+-------+
|  1 | Ayana Ferry |   17 | 1-1   |
+----+-------------+------+-------+
1 row in set (0.00 sec)


MariaDB [handson]> insert into mytable(name,age,class) values('Lina Bosco','17','1-3'),('Cortney Reichel','18','2-3'),('Aron Kozey','19','3-2');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [handson]> select * from mytable;
+----+-----------------+------+-------+
| id | name            | age  | class |
+----+-----------------+------+-------+
|  1 | Ayana Ferry     |   17 | 1-1   |
|  2 | Lina Bosco      |   17 | 1-3   |
|  3 | Cortney Reichel |   18 | 2-3   |
|  4 | Aron Kozey      |   19 | 3-2   |
+----+-----------------+------+-------+
4 rows in set (0.00 sec)


## 7. 데이터 변경하기 
MariaDB [handson]> update mytable set class='1-2' where id='1';
Query OK, 1 row affected (0.00 sec)

MariaDB [handson]> select * from mytable  where id='1';

+----+-----------------+------+-------+
| id | name            | age  | class |
+----+-----------------+------+-------+
|  1 | Ayana Ferry     |   17 | 1-2   | 
+----+-----------------+------+-------+
1 rows in set (0.00 sec)


## 8. 테이블에 데이터 삭제하기
### 조건 삭제
MariaDB [handson]> delete from mytable where id='1';
Query OK, 1 row affected (0.00 sec)

MariaDB [handson]> select * from mytable;
+----+-----------------+------+-------+
| id | name            | age  | class |
+----+-----------------+------+-------+
|  2 | Lina Bosco      |   17 | 1-3   |
|  3 | Cortney Reichel |   18 | 2-3   |
|  4 | Aron Kozey      |   19 | 3-2   |
+----+-----------------+------+-------+
3 rows in set (0.00 sec)


### 전체 삭제
MariaDB [handson]> delete from mytable;
Query OK, 3 rows affected (0.00 sec)

MariaDB [handson]> select * from mytable;
Empty set (0.00 sec)

```