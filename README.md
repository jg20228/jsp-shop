#### Jsp Shop

##
```
참고한 사이트들...

```


## 오라클 12C 사용자 생성
```sql
alter session set "_ORACLE_SCRIPT"=true;  
CREATE USER shop IDENTIFIED BY bitc5600;

GRANT CREATE SESSION TO shop;
GRANT CREATE TABLESPACE TO shop;
GRANT CREATE TABLE TO shop;
GRANT CREATE SEQUENCE TO shop;
alter user shop default tablespace users quota unlimited on users;
```

## 테이블
```sql
CREATE TABLE member(
	id number primary key,
	name varchar2(100) not null,
	username varchar2(100) not null unique,
	password varchar2(100) not null,
	birthdate timestamp not null,
	gender varchar2(4) not null,
	address varchar2(100) not null,
	phone varchar2(11) not null,
	email varchar2(100) not null,
	userRole varchar2(20),
	agreement varchar2(10)
);

CREATE TABLE orders(
	id number primary key,
	memberId number,
	orderDate timestamp not null,
	totalPrice number not null,
	foreign key(memberId) references member(id)
);

CREATE TABLE product(
	id number primary key,
	name varchar2(100) not null,
	price number not null
);
```