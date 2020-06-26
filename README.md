#### Jsp Shop

##
```
참고한 사이트들...


```

## 참고2
```
도로명 주소 API https://www.juso.go.kr/

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
	phone varchar2(13) not null,
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
	price number not null,
	imgSrc varchar2(100) not null,
	categoryId number not null
);

CREATE TABLE category(
	id number primary key,
	productId number,
	name varchar2(100) not null,
	foreign key(productId) references product(id)
);
```

## 시퀀스
```
CREATE SEQUENCE member_SEQ START WITH 1 INCREMENT BY 1;
```

## Test data
```
INSERT INTO product(id,name,price,imgSrc,categoryId)
VALUES(1,'test1',51000,'/shop/testImg/Tcarousel1.png',1);

INSERT INTO product(id,name,price,imgSrc,categoryId)
VALUES(2,'test2',37000,'/shop/testImg/Tcarousel2.png',1);

INSERT INTO product(id,name,price,imgSrc,categoryId)
VALUES(3,'test3',24000,'/shop/testImg/Tcarousel3.png',1);

INSERT INTO product(id,name,price,imgSrc,categoryId)
VALUES(4,'test4',19000,'/shop/testImg/Tcarousel1.png',1);

INSERT INTO category(id,productId,name)
VALUES(1,1,'CARDIGAN');
```

