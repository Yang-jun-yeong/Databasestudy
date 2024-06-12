--CHAPTER 07. DML(Data Manipulation Language)
/*
DML�̶�?
������ ���۾�� ���̺� �����͸� ��ȸ, �߰�, ����, ���� �Ҷ� ����ϴ� ���Ǿ��̴�.
���̺��� ���ϴ� �����͸� �Է� ����, �����Ѵ�.

DML�� ����
SELECT : ������ ��ȸ
INSERT : ������ �߰�
UPDATE : ������ ����
DELETE : ������ ����

INSERT �����
INSERT INTO ���̺� ��(�÷�1,�÷�2,...,�÷�N)
VALUES (��1,��2,..,��N)
-->INSERT�� �Է��� �÷��� VALUES�� �Է��� ���� ������ �ڷ����� �°� ����Ѵ�.

INSERT INTO ���̺� ��
VALUES (��,...)
-->INSERT�� �÷�����Ʈ ������ DBMS�� �ش� ���̺��� �÷��� �� �ۼ��� ������ �����ؼ�
-- �� ���̺� �÷� ������ �ڷ����� �°� �� �ۼ��� �ؾ��Ѵ�.
*/

SELECT *FROM JUN_JOIN;

-- 1.���� ������ �ֱ�
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, PHONE, EMAIL)
VALUES ('JUN01','12345','���ؿ�',SYSDATE,29,'010-5090-3484','junline3484@naver.com');

--2.���� ¦���� ������ �ֱ�
--NULL���� ��������� �Է��� �Ͽ���.

INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, PHONE, EMAIL)
VALUES ('SANG02','1111','�����',SYSDATE,33,NULL,'');

--3.���� ģ���� ������ �ֱ�
--��ȭ��ȣ�� �̸��� ������ NULL������ �Է�
--NULL ���� �Ͻ������� �Է� �Ͽ���.

INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE)
VALUES('JUN03','3333','�̵���',SYSDATE,22);

SELECT * FROM JUN_JOIN;


-- ���̺� ������ �Է½� ���� ����Ʈ 

-- 1. �÷�����Ʈ�� �Է� ���� ������ �ٸ� ���
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL ����: ORA-00913: too many values 
--> �÷� ����Ʈ�� ������ �Է� �� ������ ��ġ�ؾ� �Ѵ�!

-- 2. �ĺ��ڿ� NULL�� �Է��� ���
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."ID")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� (�ĺ��ڴ� NOT NULL + UNIQUE �ߺ��Ұ�)

-- 3. NOT NULL�� �÷��� NULL�� ���� ���
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."NAME")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� ( NOT NULL ���� )

-- 4. �ڷ����� ���� �ʰ� �Է� ���� ���� ���
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, '29��', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> �÷��� ���� �ڷ����� �°� �ۼ��� �Ǿ� �Ѵ�. (AGE�� ������ �ڷ���)

-- 5. �ĺ��� �÷��� �ߺ� ���� ���� ���� ���
INSERT INTO JUN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> ���� �� ���¿��� �ѹ��� ������ �Ǹ� �ĺ��ڰ� ���� �ߺ��� �Ǽ� ������ ��

SELECT * FROM JUN_JOIN;

--�÷�����Ʈ�� ���� �ʰ� INSERT �ϴ� ���

INSERT INTO JUN_JOIN
VALUES('JU',4444,'�����',SYSDATE,65,'010-1111-2222','KKK@NAVER.COM');

--INTSERT �ǽ�

CREATE TABLE SCHOOL_SONGLIST(

NO NUMBER(3) PRIMARY KEY,
TITLE VARCHAR2(20) NOT NULL,
SINGER VARCHAR2(20) ,
GENDER VARCHAR(10) CHECK(GENDER IN ('����','����'))

);

--ALTER TABLE SCHOOL_SONGlIST ADD CONSTRAINT NO_PK PRIMARY KEY(NO);
--ALTER TABLE SCHOOL_SONGLIST ADD CONSTRAINT CHECK_CK CHECK (GENDER IN('����','����'));

DROP TABLE SCHOOL_SONGLIST;

SELECT * FROM SCHOOL_SONGLIST;


-- UPDATE : ���̺��� �����͸� �����ϰ� ������ ���
-- UPDATE ���̺��
-- SET ������ �÷� == �����Ͱ�, ...
-- WHERE �����͸� ������ ���� �����ϱ� ���� ���ǽ�;
--> (�߿�) WHERE �������� ������ ��� ���̺� �� ����� ��� �÷��� �����Ͱ� ����ȴ�.

SELECT * FROM JUN_JOIN;

UPDATE JUN_JOIN
SET AGE = 70
WHERE ID = 'JU';

--> ������ �ɶ��� PK�� �÷��� �Ŵ� ���� �ùٸ� ����̴�.

--DELETE : �����͸� ������ �� ����ϴ� ��ɾ�
--�����
--DELETE FROM ���̺��
--WHERE ������ ��� ���� �����ϱ� ���� ���ǽ�;
--(�߿�) WHERE �������� ������ ��� ���̺��� ��� �����Ͱ� �����ȴ�.

--28�� ������ ȸ������ ���� ����
DELETE FROM JUN_JOIN
WHERE AGE <=28;