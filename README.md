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
DROP TABLE notice;
DROP TABLE orders_detail;
DROP TABLE product_detail;
DROP TABLE product_review;
DROP TABLE REPLY;
DROP TABLE product_qna;
DROP TABLE orders;
DROP TABLE cart;
DROP TABLE wishList;
DROP TABLE member;
DROP TABLE product;
DROP TABLE category;

CREATE TABLE member(
	id number primary key,
	name varchar2(100) not null,
	username varchar2(100) not null unique,
	password varchar2(100) not null,
	birthdate timestamp not null,
	gender varchar2(4) not null,
	address varchar2(200) not null,
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

CREATE TABLE category(
	id number primary key,
	type varchar2(100) not null,
    parentTypeId number,
	foreign key(parentTypeId) references category(id)
);

CREATE TABLE product(
	id number primary key,
    name varchar2(100) not null,
	type varchar2(100) not null,
	titleComment CLOB not null,
	price number not null,
	thumbnailW varchar2(100) not null,
	thumbnailH varchar2(100) not null,
	contents CLOB not null,
	categoryId number not null,
    foreign key(categoryId) references category(id)
);

CREATE TABLE orders_detail(
	id number primary key,
	orderId number,
    productId number,
    quantity number default 1,
    price number not null,
	foreign key(orderId) references orders(id),
    foreign key(productId) references product(id)
);

CREATE TABLE product_qna(
	id number primary key,
    category varchar2(100),
	replyState varchar2(100) not null,
	title varchar2(100) not null,
    content varchar2(100) not null,
	qnaDate TIMESTAMP not null,
    memberId number,
    foreign key(memberId) references member(id)
);
    
CREATE TABLE product_review(
	id number primary key,
    title varchar2(100),
    content varchar2(100),
    reviewDate TIMESTAMP not null,
    photo BLOB,
    memberId number,
    foreign key(memberId) references member(id)
);    

CREATE TABLE product_detail(
	id number primary key,
    productId number,
    reviewId number,
    qnaId number,
    foreign key(productId) references product(id),
    foreign key(reviewId) references product_review(id),
    foreign key(qnaId) references product_qna(id)
);

CREATE TABLE notice(
	id number primary key,
	memberId number,
	title varchar2(100) not null,
	content clob,
	createDate timestamp not null,
	readCount number not null,
	foreign key (memberId) references member(id)
);

CREATE TABLE reply(
	id number primary key,
	memberId number,
	content varchar2(100) not null,
    qnaId number,
	orderDate timestamp not null,
	foreign key (qnaId) references product_qna(id)
);

CREATE TABLE cart(
	id number primary key,
	memberId number,
	productId number,
	quantity number,
    foreign key (memberId) references member(id)
);

CREATE TABLE wishList(
	id number primary key,
	memberId number,
	productId number,
    foreign key (memberId) references member(id),
    foreign key (productId) references product(id)
);

CREATE TABLE withItem(
	id number primary key,
	productId number,
	detailId number,
    foreign key (productId) references product(id),
	foreign key (detailId) references product_detail(id)
)

```

## 시퀀스
```
DROP SEQUENCE wishList_SEQ;
DROP SEQUENCE category_SEQ;
DROP SEQUENCE member_SEQ;
DROP SEQUENCE notice_SEQ;
DROP SEQUENCE orders_SEQ;
DROP SEQUENCE orders_detail_SEQ;
DROP SEQUENCE product_SEQ;
DROP SEQUENCE product_detail_SEQ;
DROP SEQUENCE product_qna_SEQ;
DROP SEQUENCE product_review_SEQ;
DROP SEQUENCE reply_SEQ;
DROP SEQUENCE cart_SEQ;
DROP SEQUENCE withItem_SEQ;

CREATE SEQUENCE wishList_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE cart_SEQ START WITH 3 INCREMENT BY 1;
CREATE SEQUENCE category_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE member_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE notice_SEQ START WITH 4 INCREMENT BY 1;
CREATE SEQUENCE orders_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE orders_detail_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE product_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE product_detail_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE product_qna_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE product_review_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE reply_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE withItem_SEQ START WITH 1 INCREMENT BY 1;
```

## TEST DATA for category
```
INSERT INTO category (id, type, parentTypeId) VALUES (100, 'OUTER', 100);
INSERT INTO category (id, type, parentTypeId) VALUES (101, 'OUTER', 100);
INSERT INTO category (id, type, parentTypeId) VALUES (102, 'JACKET', 100);
INSERT INTO category (id, type, parentTypeId) VALUES (103, 'BBY', 100);
INSERT INTO category (id, type, parentTypeId) VALUES (104, 'CARDIGAN', 100);
INSERT INTO category (id, type, parentTypeId) VALUES (105, 'COAT', 100);

INSERT INTO category (id, type, parentTypeId) VALUES (200, 'TOP', 200);
INSERT INTO category (id, type, parentTypeId) VALUES (201, 'TOP', 200);
INSERT INTO category (id, type, parentTypeId) VALUES (202, 'STRIPE', 200);
INSERT INTO category (id, type, parentTypeId) VALUES (203, 'KNIT', 200);
INSERT INTO category (id, type, parentTypeId) VALUES (204, 'BASIC', 200);
INSERT INTO category (id, type, parentTypeId) VALUES (205, 'MTM', 200);

```

## Test data for product
```
INSERT INTO product(id,name,type, titleComment, price,thumbnailW,thumbnailH,contents,categoryId)
VALUES(1,'test1', 'OUTER', '언니가 인스타에서 추천한 바지 ♥♥ 색감 하나하나 너무 예뻐요 ! 컬러 추가되어 재진행합니다 :)', 51000, '/shop/image/detail/thumbW(1).jpg', '/shop/image/detail/thumbH(1).gif','disc컨텐츠 예약',100);

INSERT INTO product(id,name,type, titleComment, price,thumbnailW,thumbnailH,contents,categoryId)
VALUES(2,'test2','OUTER', '확실히 포인트 되면서도 얼굴 작아 보이게 만들어주는 사랑스러운 이어링이에요 ♥',37000, '/shop/image/detail/thumbW(2).jpg','/shop/image/detail/thumbH(2).gif','disc컨텐츠 예약',100);

INSERT INTO product(id,name,type, titleComment, price,thumbnailW,thumbnailH,contents,categoryId)
VALUES(3,'test3','OUTER', '캐주얼한 나그랑 티셔츠예요 ! 박시핏이라 남녀 공용으로 편하게 입으실 수 있어요 ♥', 24000, '/shop/image/detail/thumbW(3).jpg','/shop/image/detail/thumbH(3).gif','disc컨텐츠 예약',100);

INSERT INTO product(id,name, type, titleComment, price,thumbnailW,thumbnailH,contents,categoryId)
VALUES(4,'test4','OUTER', '톡톡 튀는 컬러들이 믹스된 타이다이 티셔츠 ! 긴팔 버전으로 나왔어요 ♡',19000, '/shop/image/detail/thumbW(4).jpg','/shop/image/detail/thumbH(4).gif','disc컨텐츠 예약',100);
```

```
INSERT INTO MEMBER(id,name,username,password,birthdate,gender,address,phone,email,userrole,agreement)
VALUES(0,'관리자','admin',1234,'2020-06-22','관','test','010-0000-0000','test@test.com','ADMIN','T');
INSERT INTO MEMBER(id,name,username,password,birthdate,gender,address,phone,email,userrole,agreement)
VALUES(1,'테스트계정','sara',1234,'2020-06-29','테','test','010-0000-0000','test@test.com','USER','T');

INSERT INTO notice(id,memberId,title,content,createDate,readCount)
VALUES(1,0,'공지사항TEST01','공지사항detail','2000-01-01',0);

INSERT INTO notice(id,memberId,title,content,createDate,readCount)
VALUES(2,0,'공지사항TEST02','공지사항detail','2000-01-01',0);

INSERT INTO notice(id,memberId,title,content,createDate,readCount)
VALUES(3,0,'공지사항TEST03','공지사항detail','2000-01-01',0);
```

## Test data for cart
```
INSERT INTO cart(id,memberId,productId,quantity)
VALUES(1,0,1,2);
INSERT INTO cart(id,memberId,productId,quantity)
VALUES(2,0,2,3);
```

## Test data for wishList
```
INSERT INTO wishlist(id,memberId,productId)
VALUES(1,0,1);
INSERT INTO wishlist(id,memberId,productId)
VALUES(2,0,2);
```

## 쿼리문 for category
```
--대분류(OUTER=100)로 중분류 찾기
SELECT a.parent_type_id, b.name, a.id, a.name
FROM categoryTest a, categoryTest b
WHERE b.id = a.parent_type_id AND b.id = 100;

--중분류로 대분류 찾기
SELECT a.parent_type_id, b.name, a.id, a.name
FROM categoryTest a, categoryTest b
WHERE b.id = a.parent_type_id AND a.id = 104;

--Cart Join문
SELECT p.id, p.name, p.type, c.id ,c.quantity,  p.price, p.thumbnail, m.id, m.username
FROM 
cart c INNER JOIN product p 
ON p.id = c.productId 
INNER JOIN member m
ON m.id = c.memberId
WHERE m.id = 0;
```