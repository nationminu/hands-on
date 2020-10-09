# 리눅스 명령어

## 온라인 테스트 환경
https://www.katacoda.com/courses/ubuntu/playground

### whoami
현재 접속한 유저의 정보를 출력하는 명령어
```
$ whoami
root
```

### pwd(print working directory)
현재 위치중인 디렉토리 출력하는 명령어
```
$ pwd
/root
```

### mkdir (make directory)
디렉토리를 생성하는 명령어, -p 옵션을 주면 하위 디렉토리까지 생성한다. 절대 경로와 상대 경로의 사용 가능이 가능하다.
```
$ mkdir /root/mydir
$ ls
mydir

$ mkdir /root/testdir/test1
mkdir: cannot create directory ‘/root/testdir/test1’: No such file or directory

$ mkdir -p /root/testdir/test1
$ ls /root/testdir
test1

$ mkdir ./testdir/test{2..10}
$ ls 
mydir  test1  test10  test2  test3  test4  test5  test6  test7  test8  test9  testdir
```

### cd(change directory)
디렉토리 경로를 이동하는 명령어, 절대 경로와 상대 경로의 이동이 가능하다.
```
$ cd /root/testdir
$ ls 
mydir  test1  test10  test2  test3  test4  test5  test6  test7  test8  test9  testdir

$ cd ..
$ pwd
/root
```

### ls(list)
디렉토리 및 파일 목록 확인하는 명령어. -a 모든 목록 출력과 -l 리스트 출력등의 옵션이 있다.
```
$ ls
mydir  testdir

$ ls -l
total 8
drwxr-xr-x  2 root root 4096 Oct  7 08:52 mydir
drwxr-xr-x 12 root root 4096 Oct  7 08:57 testdir

ls -a
.  ..  .bashrc  .cache  .hushlogin  mydir  .profile  .ssh  testdir  .vimrc

$ ls -al
total 36
drwx------  6 root root 4096 Oct  7 09:02 .
drwxr-xr-x 25 root root 4096 Jul 16 11:39 ..
-rw-r--r--  1 root root 3122 Jul 16 11:37 .bashrc
drwx------  2 root root 4096 Oct  7 08:43 .cache
-rw-r--r--  1 root root    0 Jul 16 11:40 .hushlogin
drwxr-xr-x  2 root root 4096 Oct  7 08:52 mydir
-rw-r--r--  1 root root  148 Aug 17  2015 .profile
drwxr-xr-x  2 root root 4096 Jul 16 11:42 .ssh
drwxr-xr-x 12 root root 4096 Oct  7 08:57 testdir
-rw-r--r--  1 root root  123 Jul 16 11:42 .vimrc
```

### cp(copy)
파일 혹은 디렉토리를 복사하는데 사용하는 명령어, 디렉토리를 복사할때는 -r 옵션을 주어 사용한다.
```
$ cp mydir mydir1
cp: omitting directory 'mydir'

$ cp -r mydir mydir1
$ cp -r mydir mydir2

$ ls
mydir  mydir1  mydir2 testdir
```

### mv(move)
파일 혹은 디렉토리 이동하는데 사용하는 명령어, 이름을 변경하는 용도로 사용한다.
```
$ mv mydir mydir3

$ ls
mydir1  mydir2  mydir3  testdir
```

### touch
파일이나 디렉토리의 최근 업데이트 일자를 현재 시간으로 변경하는 명령어 , 파일이나 디렉토리가 존재하지 않으면 파일 생성한다.
```
$ touch myfile1
$ touch myfile2

$ ls
mydir1  mydir2  mydir3  myfile1  myfile2  testdir

$ ls -al myfile1
-rw-r--r-- 1 root root 0 Oct  8 08:23 myfile1

$ touch myfile1

$ ls -al myfile1
-rw-r--r-- 1 root root 0 Oct  8 08:24 myfile1
```

### rm (remove)
파일이나 디렉토리를 삭제하는데 사용하는 명령어, 디렉토리를 삭제할떄는 -r 옵션을 주고 사용한다. -f 옵션은 삭제여부를 묻지않고 삭제한다.
```
$ rm mydir3
rm: cannot remove 'mydir3': Is a directory

$ rm -rf mydir3
mydir1  mydir2  myfile1  myfile2  testdir

$ rm -f myfile2
mydir1  mydir2  myfile1  testdir
```

### echo, cat (concatenate)
"echo" : 문자열을 출력해주는 명령어, > 와 함께 사용하여 파일을 생성하거나 내용을 변경할 수 있다.

"cat" : 파일을 내용을 출력하는데 사용하는 명령어, 파일의 내용을 합치거나, 새로운 파일을 만들때도 사용한다.

"redirection" ('>', '>>') : 스트림의 방향을 조정하는 명령어, "명령 > 파일" 명령의 결과를 파일로 저장한다.
```
$ echo "hello"
hello

$ echo "hello" > hello.txt
$ cat hello.txt
hello

$ echo "world" > world.txt
$ cat world.txt
world

$ cat hello.txt world.txt
hello
world

$ cat hello.txt world.txt
hello
world

$ cat hello.txt world.txt  > helloworld.txt
$ cat helloworld.txt
hello
world

```

### head
파일의 앞부분을 출력하는 명령어 , - 옵션으로 설정된 라인만큼을 출력한다. 설정하지 않을 경우 10줄을 출력한다.
```
$ for i in {1..100}; do echo $i >> example.txt ; done

$ head example.txt

$ head example.txt
1
2
3
4
5
6
7
8
9
10

$ head  -5 example.txt
1
2
3
4
5
```

### tail
파일을 뒷부분을 출력하는 명령어, - 옵션으로 설정된 라인만큼을 출력한다. 설정하지 않을 경우 10줄을 출력한다. -f 옵션은 파일이 변경되면 실시간으로 내용을 업데이트한다.
```
$ tail example.txt
91
92
93
94
95
96
97
98
99
100

$ tail -5 example.txt
96
97
98
99
100

$ tail -f example.txt
91
92
93
94
95
96
97
98
99
100
```

### find
파일이나 디렉토리를 검색하는 명령어, 디렉토리 경로에서 파일이름 확장자와 같은 검색 조건으로 검색한다.
-exec 옵션으로 다른 명령어와 함께 사용이 가능하다.
```
$ find ./ -name "test1"
./testdir/test1

$ find ./ -name "*.txt"
./world.txt
./helloworld.txt
./hello.txt
./example.txt

$ find ./ -type d
./
./mydir2
./.ssh
./mydir1
./.cache
./testdir
./testdir/test4
./testdir/test8
./testdir/test5
./testdir/test2
./testdir/test3
./testdir/test7
./testdir/test10
./testdir/test1
./testdir/test6
./testdir/test9

$ find ./ -type f
./.ssh/config
./.ssh/id_rsa
./.ssh/authorized_keys
./myfile1
./.bashrc
./.profile
./world.txt
./.vimrc
./.cache/motd.legal-displayed
./helloworld.txt
./hello.txt
./example.txt
./.hushlogin

$ find ./ -name "*.txt" -exec rm -f {} \;
$ find ./ -name "*.txt"
```


### man(Manual pager utils)
명령어의 사용법이나 매뉴얼을 보는 명령어
```
$ man cat
NAME 
        cat - concatenate files and print on the standard output

SYNOPSIS
        cat [OPTION] ...    [FILE] ... 
```

### yum(Yellowdog Updater, Modified)
yum 은  python 으로 작성한 대화형 패키지 관리 시스템으로 Red Hat Linux 시스템의 관리를 편하게 하기 위해 만들어 졌다.
```
yum list

yum -y update

yum -y install httpd

yum -y install mariadb

yum -y uninstall httpd
```

### apt-get(Advanced Packaging Tool)
apt-get은 우분투(Ubuntu)를 포함안 데비안(Debian)계열의 리눅스에서 쓰이는 패키지 관리 명령어이다.
```
apt-get update

apt-get install apache

apt-get remove apache
```

```

