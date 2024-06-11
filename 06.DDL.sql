--CHAPTER 06. DDL(Data Definition Language)
/*
DDL�̶�?
�����͸� ���Ǿ�� ���̺� ���� ����� ��ü�� ���� �����ϴ� ���

[DDL ��ɾ� ����]
CREATE : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
ALTER : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
RENAME : ���̺� �̸��� �����ϴ� ��ɾ�
TRUNCATE : ���̺��� �����͸� �����ϴ� ����
DROP : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
 
[���̺� ������ ���� ����ϴ� �ڷ���]
VARCHAR2(N) : ������ ������, Nũ�⸸ŭ �Է� ����
NUMMBER(P,S) :������ ���� P�ڸ���ŭ �Է¹ް� S�ڸ� ��ŭ �Ҽ��� �Է� ����
����Ŭ�����ͺ��̽������� �Ǽ��� ���� ��� ǥ���� ����
�Ұ�ȣ�� �����ϰ� �Ǹ� �ִ밪�� 38 ũ�Ⱑ ��
DATE: ���� ��¥ ���� �Է� ����
 
*/
--���������� ���̺��� Ȯ���ؼ� TEST_������������� ���̺��� ������!!
--���������� ���̺���� �巡�� �� SHIFT+F4 ������ ���̺� ���� ���� Ȯ�� ����

CREATE TABLE TEST_����������(
    �л�ID VARCHAR2(9),
    �л��̸� VARCHAR2(50),
    �Ҽӹ� VARCHAR2(5)
);

SELECT * FROM TEST_����������;

--����ǥ ���̺��� Ȯ���ؼ� TEST_����ǥ ��� ���̺��� ������!
CREATE TABLE TEST_����ǥ(
    �л�ID VARCHAR2(9),
    ���� VARCHAR2(30),
    ���� NUMBER
);
SELECT * FROM TEST_����ǥ;

--�ǽ�1)
CREATE TABLE PR_LOGIN(
    ID VARCHAR2(20),
    PW VARCHAR2 (20),
    EMAIL VARCHAR2 (20),
    NAME VARCHAR2 (20)
    );

SELECT *FROM PR_LOGIN;

/*
���������̶�?
���̺� �Է� ������ �����͸� �������� �����ϴ� ��
�������� ��Ȯ���� �����ϱ� ���� �������� ����
���� ���� ���� ��Ŀ� ���� �������� �����̳� ���� ���ο� ������ ���� �� �ִ�.

[���� ������ ����]
PRIMARY KEY(PK) :�⺻Ű, NOT NULL+UNIQUE ->NULL�Ұ�+�ߺ��Ұ�
UNIQUE KEY(UK) : ����Ű, NULL �� �Է� ����, �� �ߺ��� �Ұ�
NOT NULL : NULL�� �Ұ���, �� �����ʹ� �� ���� �� �� ����ϴ� ��
CHECK : ������ �����͸� �Է� ����
FOREIGN KEY (FK) : �ܷ�Ű, �� ���̺��� �����ϴ� Ű
*/

--�������� �Ŵ� ���
--ALTER TABLE ���̺�� ADD CONSTRAINT ���������̸� ��������(�ش��÷�);

--���̺� PK �������� �����ϱ�
SELECT *FROM PR_LOGIN;

ALTER TABLE PR_LOGIN ADD CONSTRAINT PR_ID_PK PRIMARY KEY (ID);

--���̺� UK �������� �����ϱ�
ALTER TABLE PR_LOGIN ADD CONSTRAINT EMAIL_UK UNIQUE(EMAIL);

--���̺� CHECK ���� ���� �����ϱ�
ALTER TABLE PR_LOGIN ADD CONSTRAINT PW_CHECK CHECK(LENGTH(PW)>3);

--���̺� FK �������� �����ϱ�
--ALTER TABLE ���̺�� ADD CONSTRAINT ���������̸� ��������(�ش��÷�)
--REFERENCES ������ ���̺��(������ �÷�);

ALTER TABLE TEST_����ǥ ADD CONSTRAINT �л�ID_FK FOREIGN KEY(�л�ID)
REFERENCES ����������(�л�ID) ;

--�������� ����
--ALTER TABLE ���̺�� MODIFY �÷� �� �ٲ� ��������;
SELECT * FROM PR_LOGIN;
ALTER TABLE PR_LOGIN MODIFY NAME NOT NULL ;

--�������� ����
--ALTER TABLE ���̺�� DROP CONSTRAINT �������� �̸�;
ALTER TABLE PR_LOGIN DROP CONSTRAINT PW_CHECK ;

--������ ���Ἲ�̶�?
--�������� ������ ���� ���¸� �ǹ�
--�� �����Ͱ� ��Ȯ�ϰ� ��ȿ�ϰ� ���� �� ����

--���Ἲ �������� ����
--��ü ���Ἲ(PK) : �⺻Ű �����̶�� �ϸ�, �ϳ��� ���̺� �ߺ��� ���� �������� �ʵ��� ����


--���� ���Ἲ(FK) : ���� �Է�, ����, ���� �Ҷ� �����Ǵ� �ٸ� ���̺���� �����Ͱ�
--��Ȯ�ϰ� �����ǵ��� ����
--���� ���迡 �ִ� �� �����Ͱ� �׻� �ϰ��� ���� ������ �ϴ� ��

--���̺� ���� ��� 1)
CREATE TABLE TB_TEST1(
    PK�׽�Ʈ NUMBER PRIMARY KEY,
    UK�׽�Ʈ NUMBER UNIQUE,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER CHECK(LENGTH(CK�׽�Ʈ)>5)
);

--���̺� ���� ��� 2)
CREATE TABLE TB_TEST2(
    PK�׽�Ʈ NUMBER,
    UK�׽�Ʈ NUMBER,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER,
    FK�׽�Ʈ NUMBER,
    --���������� �߰�
    --CONSTRAING �������Ǹ� ��������(�÷�)
    CONSTRAINT PK�׽�Ʈ_PK PRIMARY KEY (PK�׽�Ʈ),
    CONSTRAINT UK�׽�Ʈ_UK UNIQUE(UK�׽�Ʈ),
    CONSTRAINT CK�׽�Ʈ_CK CHECK(CK�׽�Ʈ>0),
    CONSTRAINT FK_�׽�Ʈ_FK FOREIGN KEY(FK�׽�Ʈ) REFERENCES TB_TEST1(PK�׽�Ʈ)
);

SELECT *FROM PR_LOGIN;

--���̺��� �÷� �߰��ϱ�
--ALTER TABLE ���̺�� ADD �÷��� �ڷ���(ũ��) ;
ALTER TABLE PR_LOGIN ADD PHONE_NUMBER VARCHAR2(10);

--�÷� �̸� �����ϱ�
--ALTER TABLE ���̺� �� RENAME COLUMN ���� �÷��� TO �ٲ� �÷� ��;
ALTER TABLE PR_LOGIN RENAME COLUMN PHONE_NUMBER TO TEL;

--�÷��� �ڷ����� �����ϱ�
--ALTER TALBE ���̺�� MODIFY �÷��� �ٲ� ��������(����);
ALTER TABLE PR_LOGIN MODIFY TEL VARCHAR(20) ;

--Ư�� �÷� �����ϱ�
--ALTER TABLE ���̺� �� DROP COLUMN �÷� ��;
ALTER TABLE PR_LOGIN DROP COLUMN TEL;

--���̺��� �̸� �����ϱ�
--RENAME ���� ���̺� �̸� TO �ٲ� ���̺� �̸�;
RENAME PR_LOGIN TO JUN_LOGIN;

--���̺� ����
--DROP TABLE ���̺��̸�;

DROP TABLE TEST_����������;
SELECT *FROM TEST_����������;

--TRUNCATE : �����͸� ���� ����
--TRUNCATE TABLE ���̺��̸� ;

--DELETE : �����ͻ���
--DELETE ���̺��̸�;

-- ���̺� �����ϴ� ������
CREATE TABLE DROP_����ǥ AS SELECT * FROM ����ǥ ;
SELECT * FROM DROP_����ǥ;

DELETE DROP_����ǥ;

ROLLBACK; -- �ǵ����� ��ɾ�
TRUNCATE TABLE DROP_����ǥ;

--���̺� �����ǽ�2)

CREATE TABLE JUN_JOIN(
                                --�������ǵ�    
    ID VARCHAR2(20) PRIMARY KEY, --PK
    PW VARCHAR2(20) NOT NULL, --NOT NULL
    NAME VARCHAR2(10)NOT NULL, --NOT NULL
    SIGNDATE DATE, --��¥���ڷ���
    AGE NUMBER(3), --������ �ڷ���
    PHONE VARCHAR2(20),
    EMAIL VARCHAR2(50) UNIQUE --UK 

);

SELECT * FROM JUN_JOIN;
ALTER TABLE JUN_JOIN RENAME COLUMN SIGNDATE TO JOIN_DATE;