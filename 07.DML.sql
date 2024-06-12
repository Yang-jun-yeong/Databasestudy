--CHAPTER 07. DML(Data Manipulation Language)
/*
DML이란?
데이터 조작어로 테이블에 데이터를 조회, 추가, 수정, 삭제 할때 사용하는 질의어이다.
테이블에서 원하는 데이터를 입력 수정, 삭제한다.

DML의 유형
SELECT : 데이터 조회
INSERT : 데이터 추가
UPDATE : 데이터 수정
DELETE : 데이터 삭제

INSERT 사용방법
INSERT INTO 테이블 명(컬럼1,컬럼2,...,컬럼N)
VALUES (값1,값2,..,값N)
-->INSERT에 입력한 컬럼과 VALUES에 입력한 값은 순서와 자료형에 맞게 써야한다.

INSERT INTO 테이블 명
VALUES (값,...)
-->INSERT에 컬럼리스트 생략시 DBMS는 해당 테이블의 컬럼을 다 작성한 것으로 간주해서
-- 그 테이블에 컬럼 순서와 자료형에 맞게 다 작성을 해야한다.
*/

SELECT *FROM JUN_JOIN;

-- 1.나의 정보를 넣기
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, PHONE, EMAIL)
VALUES ('JUN01','12345','양준영',SYSDATE,29,'010-5090-3484','junline3484@naver.com');

--2.나의 짝궁의 정보를 넣기
--NULL값을 명시적으로 입력을 하였다.

INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, PHONE, EMAIL)
VALUES ('SANG02','1111','방상재',SYSDATE,33,NULL,'');

--3.나의 친구의 정보를 넣기
--전화번호와 이메일 정보를 NULL값으로 입력
--NULL 값을 암시적으로 입력 하였다.

INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE)
VALUES('JUN03','3333','이도연',SYSDATE,22);

SELECT * FROM JUN_JOIN;


-- 테이블에 데이터 입력시 에러 리스트 

-- 1. 컬럼리스트와 입력 값의 개수가 다른 경우
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL 오류: ORA-00913: too many values 
--> 컬럼 리스트의 갯수와 입력 값 개수는 일치해야 한다!

-- 2. 식별자에 NULL을 입력한 경우
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."ID")
--> 컬럼에 대한 제약조건에 맞게 작성 해야함 (식별자는 NOT NULL + UNIQUE 중복불가)

-- 3. NOT NULL인 컬럼에 NULL을 넣은 경우
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."NAME")
--> 컬럼에 대한 제약조건에 맞게 작성 해야함 ( NOT NULL 조건 )

-- 4. 자료형에 맞지 않게 입력 값을 넣은 경우
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, '29살', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> 컬럼에 대한 자료형에 맞게 작성이 되야 한다. (AGE는 숫자형 자료형)

-- 5. 식별자 컬럼에 중복 값을 넣을 려는 경우
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> 값이 들어간 상태에서 한번더 실행이 되면 식별자가 값이 중복이 되서 에러가 남

SELECT * FROM JUN_JOIN;

--컬럼리스트를 쓰지 않고 INSERT 하는 방법

INSERT INTO JUN_JOIN
VALUES('JU',4444,'대통령',SYSDATE,65,'010-1111-2222','KKK@NAVER.COM');

--INTSERT 실습

CREATE TABLE SCHOOL_SONGLIST(

NO NUMBER(3) PRIMARY KEY,
TITLE VARCHAR2(20) NOT NULL,
SINGER VARCHAR2(20) ,
GENDER VARCHAR(10) CHECK(GENDER IN ('남자','여자'))

);

--ALTER TABLE SCHOOL_SONGlIST ADD CONSTRAINT NO_PK PRIMARY KEY(NO);
--ALTER TABLE SCHOOL_SONGLIST ADD CONSTRAINT CHECK_CK CHECK (GENDER IN('남자','여자'));

DROP TABLE SCHOOL_SONGLIST;

SELECT * FROM SCHOOL_SONGLIST;


-- UPDATE : 테이블의 데이터를 변경하고 싶을때 사용
-- UPDATE 테이블명
-- SET 변경할 컬럼 == 데이터값, ...
-- WHERE 데이터를 변경할 행을 선별하기 위한 조건식;
--> (중요) WHERE 조건절을 생략할 경우 테이블 내 저장된 모든 컬럼의 데이터가 변경된다.

SELECT * FROM JUN_JOIN;

UPDATE JUN_JOIN
SET AGE = 70
WHERE ID = 'JU';

--> 조건을 걸때는 PK인 컬럼을 거는 것이 올바른 방법이다.

--DELETE : 데이터를 삭제할 떄 사용하는 명령어
--사용방법
--DELETE FROM 테이블명
--WHERE 삭제할 대상 행을 선별하기 위한 조건식;
--(중요) WHERE 조건절을 생략할 경우 테이블의 모든 데이터가 삭제된다.

--28살 이하인 회원들의 정보 삭제
DELETE FROM JUN_JOIN
WHERE AGE <=28;