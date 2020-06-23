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
