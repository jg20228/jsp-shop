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
DROP TABLE withItem;
DROP TABLE orders_detail;
DROP TABLE review;
DROP TABLE REPLY;
DROP TABLE qna;
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

CREATE TABLE qna(
	id number primary key,
    productId number,
	replyState varchar2(100) not null,
	title varchar2(100) not null,
    content varchar2(200) not null,
	qnADate TIMESTAMP not null,
    memberId number,
    foreign key(productId) references product(id),
	foreign key(memberId) references member(id)
);
    
CREATE TABLE review(
	id number primary key,
    star number,
    content varchar2(100),
    reviewDate TIMESTAMP not null,
    photo CLOB,
    memberId number,
	productId number,
	foreign key(productId) references product(id),
    foreign key(memberId) references member(id)
	
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
	replyDate timestamp not null,
	foreign key (qnaId) references qna(id)
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
	parentProductId number,
	withItemId number,
    foreign key (parentProductId) references product(id),
	foreign key (withItemId) references product(id)
);


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
DROP SEQUENCE qna_SEQ;
DROP SEQUENCE review_SEQ;
DROP SEQUENCE reply_SEQ;
DROP SEQUENCE cart_SEQ;
DROP SEQUENCE withItem_SEQ;

CREATE SEQUENCE wishList_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE cart_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE category_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE member_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE notice_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE orders_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE orders_detail_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE product_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE qnA_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE Review_SEQ START WITH 1 INCREMENT BY 1;
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
VALUES(product_SEQ.nextval,'test1', 'OUTER', '언니가 인스타에서 추천한 바지 ♥♥ 색감 하나하나 너무 예뻐요 ! 컬러 추가되어 재진행합니다 :)', 51000, '/shop/image/detail/thumbW(1).jpg', '/shop/image/detail/thumbH(1).gif','disc컨텐츠 예약',100);

INSERT INTO product(id,name,type, titleComment, price,thumbnailW,thumbnailH,contents,categoryId)
VALUES(product_SEQ.nextval,'test2','OUTER', '확실히 포인트 되면서도 얼굴 작아 보이게 만들어주는 사랑스러운 이어링이에요 ♥',37000, '/shop/image/detail/thumbW(2).jpg','/shop/image/detail/thumbH(2).gif','disc컨텐츠 예약',100);

INSERT INTO product(id,name,type, titleComment, price,thumbnailW,thumbnailH,contents,categoryId)
VALUES(product_SEQ.nextval,'test3','OUTER', '캐주얼한 나그랑 티셔츠예요 ! 박시핏이라 남녀 공용으로 편하게 입으실 수 있어요 ♥', 24000, '/shop/image/detail/thumbW(3).jpg','/shop/image/detail/thumbH(3).gif','disc컨텐츠 예약',100);

INSERT INTO product(id,name, type, titleComment, price,thumbnailW,thumbnailH,contents,categoryId)
VALUES(product_SEQ.nextval,'test4','OUTER', '톡톡 튀는 컬러들이 믹스된 타이다이 티셔츠 ! 긴팔 버전으로 나왔어요 ♡',19000, '/shop/image/detail/thumbW(4).jpg','/shop/image/detail/thumbH(4).gif','disc컨텐츠 예약',100);

INSERT INTO product(id,name, type, titleComment, price,thumbnailW,thumbnailH,contents,categoryId)
VALUES(product_SEQ.nextval,'test5','OUTER', '결제 테스트용 product',1000, '/shop/image/detail/thumbW(4).jpg','/shop/image/detail/thumbH(4).gif','disc컨텐츠 예약',100);

```

```
INSERT INTO MEMBER(id,name,username,password,birthdate,gender,address,phone,email,userrole,agreement)
VALUES(0,'관리자','admin',1234,'2020-06-22','관','test/test2/test3','010-0000-0000','test@test.com','ADMIN','T');
INSERT INTO MEMBER(id,name,username,password,birthdate,gender,address,phone,email,userrole,agreement)
VALUES(member_SEQ.nextval,'테스트계정','sara',1234,'2020-06-29','테','test/test2/test3','010-0000-0000','test@test.com','USER','T');

INSERT INTO MEMBER(id,name,username,password,birthdate,gender,address,phone,email,userrole,agreement)
VALUES(member_SEQ.nextval,'단무지','muzi',1234,'2020-07-01','테','test/test2/test3','010-0000-0000','test@test.com','USER','T');

INSERT INTO MEMBER(id,name,username,password,birthdate,gender,address,phone,email,userrole,agreement)
VALUES(member_SEQ.nextval,'라이언','lion',1234,'2020-07-01','테','test/test2/test3','010-0000-0000','test@test.com','USER','T');


INSERT INTO notice(id,memberId,title,content,createDate,readCount)
VALUES(notice_SEQ.nextval,0,'공지사항TEST01','공지사항detail','2000-01-01',0);

INSERT INTO notice(id,memberId,title,content,createDate,readCount)
VALUES(notice_SEQ.nextval,0,'공지사항TEST02','공지사항detail','2000-01-01',0);

INSERT INTO notice(id,memberId,title,content,createDate,readCount)
VALUES(notice_SEQ.nextval,0,'공지사항TEST03','공지사항detail','2000-01-01',0);
```

## Test data for cart & wishList
```
INSERT INTO cart(id,memberId,productId,quantity)
VALUES(cart_SEQ.nextval,0,1,2);

INSERT INTO cart(id,memberId,productId,quantity)
VALUES(cart_SEQ.nextval,0,2,3);

INSERT INTO wishlist(id,memberId,productId)
VALUES(wishList_SEQ.nextval,0,1);

INSERT INTO wishlist(id,memberId,productId)
VALUES(wishList_SEQ.nextval,0,2);

```

## Test data for orders & orders_detail
```
INSERT INTO orders(id,memberId,orderDate,totalPrice)
VALUES(orders_SEQ.nextval,0,'2020-06-30',102000);

INSERT INTO orders(id,memberId,orderDate,totalPrice)
VALUES(orders_SEQ.nextval,1,'2020-06-28',61000);

INSERT INTO orders(id,memberId,orderDate,totalPrice)
VALUES(orders_SEQ.nextval,1,'2020-06-29',38000);

INSERT INTO orders_detail(ID,orderId,productId,quantity,price)
VALUES(orders_detail_SEQ.nextval,1,1,2,102000);

INSERT INTO orders_detail(ID,orderId,productId,quantity,price)
VALUES(orders_detail_SEQ.nextval,2,2,1,37000);

INSERT INTO orders_detail(ID,orderId,productId,quantity,price)
VALUES(orders_detail_SEQ.nextval,2,3,1,24000);

INSERT INTO orders_detail(ID,orderId,productId,quantity,price)
VALUES(orders_detail_SEQ.nextval,3,4,2,19000);
```

## Test data for withItem
```
INSERT INTO withItem (id, parentProductId, withitemId)
VALUES(withItem_SEQ.nextval, 1, 2);

INSERT INTO withItem (id, parentProductId, withitemId)
VALUES(withItem_SEQ.nextval, 1, 3);

INSERT INTO withItem (id, parentProductId, withitemId)
VALUES(withItem_SEQ.nextval, 1, 4);

INSERT INTO withItem (id, parentProductId, withitemId)
VALUES(withItem_SEQ.nextval, 2, 1);

INSERT INTO withItem (id, parentProductId, withitemId)
VALUES(withItem_SEQ.nextval, 2, 3);

INSERT INTO withItem (id, parentProductId, withitemId)
VALUES(withItem_SEQ.nextval, 2, 4);
```

## 쿼리문 for review
```
INSERT INTO review (id, star, content, reviewDate, photo, memberId, productId)
VALUES(review_SEQ.nextval, 3, '정말 잘 어울려요!', '2020-06-29', '/shop/image/detail/review(1).jpg', 1, 1);

INSERT INTO review (id, star, content, reviewDate, photo, memberId, productId)
VALUES(review_SEQ.nextval, 5,'배송 빨라요!', '2020-07-01', '/shop/image/detail/review(2).jpg', 2, 1);

INSERT INTO review (id, star, content, reviewDate, photo, memberId, productId)
VALUES(review_SEQ.nextval, 4, '마음에 쏙 들어요~!', '2020-07-02', '/shop/image/detail/review(3).jpg', 3, 1);
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
```

## 사용된 Join 문
```
--Cart Join문
SELECT p.id, p.name, p.type, c.id ,c.quantity,  p.price, p.thumbnail, m.id, m.username
FROM 
cart c INNER JOIN product p 
ON p.id = c.productId 
INNER JOIN member m
ON m.id = c.memberId
WHERE m.id = 0;

--WithItem JOIN문
SELECT p.id, p.name, p.type, p.titlecomment, p.price, p.thumbnailW, p.thumbnailH, p.contents, p.categoryId, w.id, w.parentproductId, w.withItemId
FROM product p INNER JOIN withItem w
ON p.id = w.withitemid
WHERE w.parentProductId = ?;

--Review JOIN문
SELECT *
FROM product p INNER JOIN review r
ON p.id = r.productId
WHERE r.productId = ?;
```

## QnA, reply Test
```
INSERT INTO qna(id,productId,replyState,title,content,qnADate,memberId)
VALUES(qna_SEQ.nextval,1,1,'QnA TEST 01', 'QnA TEST 01 content','2020-07-04',1);

INSERT INTO qna(id,productId,replyState,title,content,qnADate,memberId)
VALUES(qna_SEQ.nextval,1,1,'QnA TEST 02', 'QnA TEST 02 content','2020-07-04',2);

INSERT INTO qna(id,productId,replyState,title,content,qnADate,memberId)
VALUES(qna_SEQ.nextval,1,1,'QnA TEST 03', 'QnA TEST 03 content','2020-07-04',3);

INSERT INTO qna(id,productId,replyState,title,content,qnADate,memberId)
VALUES(qna_SEQ.nextval,2,0,'QnA TEST 04', 'QnA TEST 04 content','2020-07-04',1);

INSERT INTO qna(id,productId,replyState,title,content,qnADate,memberId)
VALUES(qna_SEQ.nextval,2,1,'QnA TEST 05', 'QnA TEST 05 content','2020-07-04',2);

INSERT INTO reply(id,memberId,content,qnaId,replyDate)
VALUES(qna_SEQ.nextval,1,'답변 01',1,'2020-07-04');

INSERT INTO reply(id,memberId,content,qnaId,replyDate)
VALUES(qna_SEQ.nextval,2,'답변 02',2,'2020-07-04');

INSERT INTO reply(id,memberId,content,qnaId,replyDate)
VALUES(qna_SEQ.nextval,2,'답변 03',3,'2020-07-04');

INSERT INTO reply(id,memberId,content,qnaId,replyDate)
VALUES(qna_SEQ.nextval,2,'답변 04',5,'2020-07-04');
```
