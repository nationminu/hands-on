# Apache 웹서버 설치

## Apache 웹서버 설치 
```
$ sudo yum -y install httpd

$ sudo systemctl start httpd

$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; vendor preset: disabled)
   Active: active (running) since Thu 2020-10-08 21:16:45 EDT; 4s ago
     Docs: man:httpd(8)
           man:apachectl(8)
 Main PID: 2579 (httpd)
   Status: "Processing requests..."
   CGroup: /system.slice/httpd.service
           ├─2579 /usr/sbin/httpd -DFOREGROUND
           ├─2580 /usr/sbin/httpd -DFOREGROUND
           ├─2581 /usr/sbin/httpd -DFOREGROUND
           ├─2582 /usr/sbin/httpd -DFOREGROUND
           ├─2583 /usr/sbin/httpd -DFOREGROUND
           └─2584 /usr/sbin/httpd -DFOREGROUND

Oct 08 21:16:45 hands-on systemd[1]: Starting The Apache HTTP Server...
Oct 08 21:16:45 hands-on httpd[2579]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using fe80:... message
Oct 08 21:16:45 hands-on systemd[1]: Started The Apache HTTP Server.
Hint: Some lines were ellipsized, use -l to show in full.
```

* http://<SERVER_IP> 기본 웹서버 페이지 확인
![test](./img/test.png)

웹페이지가 확인되지 않을 경우 방화벽 종료후 다시 확인
```
$ sudo systemctl stop firewalld
```

HTML 테스트 페이지 만들기 [index.html](./index.html)
```
$ cd /var/www/html

$ vi index.html
<HTML>
<HEAD>
<TITLE>MY First LAbS</TITLE>
</HEAD>
<BODY>
HELLO WORLD
</BODY>
</HEML> 
```

브라우저 접속시 변경된 내용 확인
![test](./img/test-1.png)