--CHAPTER 09. DCL(Data Control Language)

--DCL이란?
--데이터베이스에 접근을 하거나 객체에 권한을 주는 등의 역할을 하는 언어.

--DCL 명령어 종류
--GRANT :권한을 부여하는 명령어
--REVO : 권한을 회수하는 명령어
--ROLE : 권한을 묶어서 부여할 때 사용하는 명령어

--사용자(USER)?
--데이터베이스에 접속하여 데이터를 관리하는 '계정'을 사용하는(USER)라고 한다.

--사용자(USER) 생성방법
--CREATE USER 사용자 이름
--IDENTIFIED BY 패스워드

--권한부여
--GRANT  시스템권한
--TO  USER;

--권한회수
--REVOKE 시스템권한
--FROM USER;

CREATE TABLE TEST_TB(
ID VARCHAR(10)
);


--ORA-01031: insufficient privileges
--> 권한이 불충분하다.

--ROLE 이란?
-- 여러 권한을 한번에 부여하기 위해 사용한다.
-- 비슷한 종류의 권한끼리 모아놓은 ROLE이라는 개념으로 한번에 권한을 묶어서 사용

--ROLE의 종류
--CONNECT : 데이터베이스 접속에 필요한 권한을 묶어 놓은것
--RESOURCE : 테이블, 시퀀스 등에 객체를 생성할 수 있는 권한을 묶어 놓은것
--DBA : 데이터베이스를 관리하는 대부분의 시스템 권한 (중요)함부로 건들면 안됨!!

--현업에서 권한을 주는 방법
--GRANT CONNECT , RESOURCE TO USER ;

--객체 권한이란?
--특정 사용자의 객체(테이블,시퀀스,뷰등)에 권한을 주는 것이다.
--즉 HR소유의 테이블을 DCLTEST 사용자가 SELECT나 UPDATE라는 DML 작업이
--가능하도록 허용할 수 있게 하는 것이다.

SELECT * FROM HR.EMPLOYEES;

--객체 권한 사용방법
--GRANT 시스템권한
--ON 스키마.객체이름
--TO USER;  

UPDATE HR.EMPLOYEES
SET FIRST_NAME = '양', LAST_NAME = '준영'
WHERE EMPLOYEE_ID = 100;

SELECT * FROM EMPLOYEES;

COMMIT;