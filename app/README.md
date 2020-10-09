# Application 만들기

> 1. Apache Tomcat 에서 어플리케이션을 테스트하기 위해서 JSP 를 이용한 페이지를 만든다.
> 2. mairadb 를 연결하기 위해 jdbc 드라이브를 다운로드 받고 설치합니다.
> 3. mariadb 에 생성된 authors 테이블과 posts 테이블의 데이터 목록을 확인하는 어플리케이션을 만든다.

## mariadb jdbc 다운로드
https://mariadb.com/kb/en/about-mariadb-connector-j/
![mariadb](./img/jdbc.PNG)
Java8 Connector 을 선택하고 다운로드 한다.
![mariadb](./img/jdbc-1.PNG)

다운로드 받은 jdbc는 /root/apache-tomcat-9.0.38/lib 에 복사한다.
```
# cp mariadb-java-client-2.6.2.jar /root/apache-tomcat-9.0.38/lib

#  ls  /root/apache-tomcat-9.0.38/lib/mariadb-java-client-2.6.2.jar 
/root/apache-tomcat-9.0.38/lib/mariadb-java-client-2.6.2.jar
```

