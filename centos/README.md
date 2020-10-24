# Centos 리눅스 설치 Hands On 

## Centos 패키지 다운로드 

https://www.centos.org/ -> Download -> 7(2003) -> x86_64 -> mirror 다운로드 

## kakao mirror direct iso
http://mirror.kakao.com/centos/7.8.2003/isos/x86_64/CentOS-7-x86_64-DVD-2003.iso

1. centos 홈페이지 접속
![page of centos](./img/centos.png)
2. Download 클릭후 패키지 선택
![page of centos](./img/download.png)
3. 미러를 통해 패키지 다운로드
![page of centos](./img/mirror.png)

---
## VMware 설정



---
## Centos 설치

### 1. 이미지를 넣고 부팅하고 설치 화면에서 "Install Centos 7"을 선택
![step](./img/1.png)

### 2. 언어선택에서 사용하고자 하는 언어 선택(한국어)
![step](./img/2.png)

### 3. 설치 요약 화면
![step](./img/3.png)

### 4. 설치 대상 선택 후 완료 클릭시 파티션 자동 설정
![step](./img/4.png)

### * 필요시 파티션을 수동으로 설정 가능(Optional)
/boot, /home, swap, root 등 파티션을 수동으로 설정후 완료 클릭합니다.
![step](./img/4-1.png) 
![step](./img/4-2.png)
![step](./img/4-3.png)
![step](./img/4-4.png)

### 5. 설치할 소프트웨어를 선택
![step](./img/5.png)

### * 용도에 맞는 설치 소프트웨어를 선택하여 설치합니다.
기본 최소 설치 진행합니다. (최소설치, 계산노드, 인프라서버, 파일 및 프린트 서버, 기본 웹 서버, 가항화 호스트, 서버 - GUI 사용, GNOME 데스크탑, KDE Plasma Workspaces, 개발 및 장조를 위한 워크스테이션)
![step](./img/5-1.png)
![step](./img/5-2.png)
![step](./img/5-3.png)
![step](./img/5-4.png)
![step](./img/5-5.png)
![step](./img/5-6.png)


### 6. 사용자 설정
초기 root 비밀번호 설정과 관리자 계정을 설정합니다.
![step](./img/6.png)
![step](./img/6-1.png) 
![step](./img/6-2.png)

### 7. 완료 단계
설치완료 후 재기동하면 로그인 화면이 나타납니다. root 또는 추가한 계정으로 로그인합니다.
![step](./img/7.png)
![step](./img/7-1.png) 
![step](./img/7-2.png)
![step](./img/7-3.png)

### 8. 네트워크 활성화

```
# vi /etc/sysconfig/network-scripts/ifcfg-ens33
# vi /etc/sysconfig/network-scripts/ifcfg-ens34
ONBOOT=yes // no -> yes 수정

# systemctl restart network
# ip a

# systemctl stop firewalld
# systemctl disable firewalld
```




