--CHAPTER 09. DCL(Data Control Language)

--DCL�̶�?
--�����ͺ��̽��� ������ �ϰų� ��ü�� ������ �ִ� ���� ������ �ϴ� ���.

--DCL ��ɾ� ����
--GRANT :������ �ο��ϴ� ��ɾ�
--REVO : ������ ȸ���ϴ� ��ɾ�
--ROLE : ������ ��� �ο��� �� ����ϴ� ��ɾ�

--�����(USER)?
--�����ͺ��̽��� �����Ͽ� �����͸� �����ϴ� '����'�� ����ϴ�(USER)��� �Ѵ�.

--�����(USER) �������
--CREATE USER ����� �̸�
--IDENTIFIED BY �н�����

--���Ѻο�
--GRANT  �ý��۱���
--TO  USER;

--����ȸ��
--REVOKE �ý��۱���
--FROM USER;

CREATE TABLE TEST_TB(
ID VARCHAR(10)
);


--ORA-01031: insufficient privileges
--> ������ ������ϴ�.

--ROLE �̶�?
-- ���� ������ �ѹ��� �ο��ϱ� ���� ����Ѵ�.
-- ����� ������ ���ѳ��� ��Ƴ��� ROLE�̶�� �������� �ѹ��� ������ ��� ���

--ROLE�� ����
--CONNECT : �����ͺ��̽� ���ӿ� �ʿ��� ������ ���� ������
--RESOURCE : ���̺�, ������ � ��ü�� ������ �� �ִ� ������ ���� ������
--DBA : �����ͺ��̽��� �����ϴ� ��κ��� �ý��� ���� (�߿�)�Ժη� �ǵ�� �ȵ�!!

--�������� ������ �ִ� ���
--GRANT CONNECT , RESOURCE TO USER ;

--��ü �����̶�?
--Ư�� ������� ��ü(���̺�,������,���)�� ������ �ִ� ���̴�.
--�� HR������ ���̺��� DCLTEST ����ڰ� SELECT�� UPDATE��� DML �۾���
--�����ϵ��� ����� �� �ְ� �ϴ� ���̴�.

SELECT * FROM HR.EMPLOYEES;

--��ü ���� �����
--GRANT �ý��۱���
--ON ��Ű��.��ü�̸�
--TO USER;  

UPDATE HR.EMPLOYEES
SET FIRST_NAME = '��', LAST_NAME = '�ؿ�'
WHERE EMPLOYEE_ID = 100;

SELECT * FROM EMPLOYEES;

COMMIT;