--CHAPTER 03. ����Ŭ �Լ�
--�Լ�(Function) ��?
-- �Է� ���� �־� Ư���� ����� ���� ��� ���� ���

--����� �����Լ�: ����ڰ� �ʿ信 ���� ���� ������ �Լ�
-- ���� �Լ� : ����Ŭ���� �̸� ����� ���� �Լ�, �ʿ��� ������ ȣ���ؼ� ���
-- �����Լ��� ������, ������, ��¥��, ��ȯ��, NULL���� �Լ�, �����Լ� 

--�Լ�() : *�Ұ�ȣ�ʼ�*
-- �Լ��� ������ �� ����ϴ� �Է� �� : �Ű�����, ���� ��

--[������ �Լ�]
--UPPER{} : ��ȣ �� ���� �����͸� ��� �빮�ڷ� ��ȯ�Ͽ� ���
--LOWER{} : ��ȣ �� ���� �����͸� ��� �ҹ��ڷ� ��ȯ�Ͽ� ���

SELECT UPPER('abced123@@')
    FROM DUAL;
--DUAL ���̺��̶�?
--�ӽ� �����̳� �Լ��� ��� �� Ȯ�� �뵵�� ����ϴ� �׽�Ʈ�� ���̺��Դϴ�.

SELECT * FROM EMPLOYEES;
--���� ���̺��� ������ FIRST_NAME�� ��� �빮�ڷ�
--������ EMAIL������ ��� �ҹ��ڷ� ��� ����ϼ���.

SELECT UPPER(FIRST_NAME) ,LOWER(EMAIL)
  FROM EMPLOYEES;
  
--LENGTH() : ��ȣ �� ���� �������� ���̸� ���ϴ� �Լ�
SELECT LENGTH('HELLO WORLD')
  FROM DUAL;

--�������̺��� ������ FIRST_NAME�� ���, FIRST_NAME���̵� ���
SELECT FIRST_NAME, LENGTH(FIRST_NAME) 
 FROM EMPLOYEES;

--������ FIRST_NAME�� ���̰� 5�� �̻��� �������� ���� ID, �̸� ���
SELECT EMPLOYEE_ID,FIRST_NAME,LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME)>=5;

--SUBSTR() : ���ڿ��� �����ϴ� �Լ�
--1) SUBSTR(�Է�, ������ġ, �������)
--���ڿ� �������� ������ġ���� ������� ��ŭ ���
--2) SUBSTR(�Է°�, ������ġ)
-- ������� ������ ���ڿ� �������� ������ġ���� ������ ���

SELECT SUBSTR('�ΰ����ɻ���б�',3,2) AS ����
, SUBSTR('�ΰ����ɻ���б�',1,4) AS �ΰ�����
, SUBSTR('�ΰ����ɻ���б�',5) AS ����б�
  FROM DUAL;

SELECT HIRE_DATE FROM EMPLOYEES;

--�Ի糯¥�� ����, ��, �� ���� �߶� ���
--�� �÷����� ����, ��, �� ���� ��Ī�� ����ؼ� ���
SELECT SUBSTR(HIRE_DATE,1,2)AS ��, SUBSTR(HIRE_DATE,4,2)AS ��, SUBSTR(HIRE_DATE,7)AS ��
FROM EMPLOYEES;

--REPLACE() : Ư�� ���ڸ� �ٸ� ���ڷ� �ٲپ� �ִ� �Լ�
--1) REPLACE(���ڿ�������, �ٲٰ� ���� ����, �ٲ���� ����)
--2) REPLACE(���ڿ�������, �ٲٰ� ���� ����)
--�ٲ�� �ϴ� ���ڸ� ���� �� �ٲٰ� ���� ���ڴ� ���ڿ� �����Ϳ��� ������ �ȴ�)
SELECT REPLACE('�ΰ�����##����б�','#','')
 FROM DUAL;
 
--�������̺��� �Ի糯¥�� ����ϵ�
--/(������) ���ڿ��� -(������)���� �ٲ㼭 ���
--/(������) ���ڿ��� �����Ͽ� ��� ���ּ���

SELECT * FROM EMPLOYEES;
SELECT REPLACE(HIRE_DATE,'/','-'),REPLACE(HIRE_DATE,'/')
  FROM EMPLOYEES;
  
--CONCAT() : �� ���ڿ� �����͸� ��ġ�� �Լ�
-- �Ű������� 2���� �� �� �ְ�, 2���� ���ڿ��� ��ġ�� �Լ�
-- �ռ������� "||"�� �̿��ϸ� ���Ѵ�� ���ڿ� ������ �����ϴ�.

SELECT  CONCAT('�ΰ�����','����б�')||' �ְ�'||' ����'||'�ڵ� �б�'
  FROM DUAL;
  
--TRIM(): �Է� ���� ������ �������� �� ���� ������ �����Ѵ�.
SELECT REPLACE(TRIM('        �������� �ְ��Դϴ�          '),' ')
  FROM DUAL;
  
--[�������Լ�]
--ROUND() :  Ư�� ��ġ���� �ݿø� �ϴ� �Լ�
--1) ROUND(�ݿø� �� ����, �ݿø� ��ġ)
--�ݿø� ��ġ ������ �Ҽ��� ù° �ڸ����� ������ �ݿø� ����
SELECT ROUND(123.45678)
  FROM DUAL;
  
--TRUNC() : Ư�� ��ġ���� ������ �Լ�
--TRUNC(������ ����, ������ġ)
--TRUNC(������ ����)
--���� ��ġ ������ �Ҽ��� ù ��° �ڸ����� ������ ���� ����

SELECT TRUNC(123.456789)
  FROM DUAL;
  
--MOD() : ���ڸ� ���� ������ ���� ���ϴ� �Լ�
--MOD(������ �� ����, ���� ����)
--Ȧ��,¦���� ������ �� �����ϰ� ����Ѵ�.

SELECT MOD(10,2) AS "0"
, MOD(10,3) AS "1"
, MOD(15,6) AS "3"
 FROM DUAL;
 
--[��¥�� �Լ�]

--SYSDATE : ���� ��¥�� �ð��� ������ִ� �Լ�
-- �Է½� �ٷ� ����� �Ǹ�, ���� �ð��� �ʴ������� ����� �����ϴ�.
-- ��¥�� �Լ��� ������ �����ϴ�.
-- ��¥�� ������ ������ ������ �Ұ����ϴ�.

SELECT SYSDATE
  FROM DUAL;
  
--��¥���� ����
--���� > ȯ�漳��> �����ͺ��̽�> NLS >��¥���� >YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE AS "����"
    ,SYSDATE -1 AS �����ǳ�¥
    ,SYSDATE +1 AS �����ǳ�¥
    --SYSDATE+SYSDATE ->��¥ �����ͳ����� ������ �Ұ����ϴ�!.
  FROM DUAL;
  
--��¥������Ȱ��(�ǹ�)
SELECT SYSDATE AS ����
        ,SYSDATE+1 AS �Ϸ����
        ,SYSDATE+1/24 AS �ѽð�����
        ,SYSDATE+1/24/60 AS �Ϻд���
        ,SYSDATE+1/24/60/60 AS ���ʴ���
FROM DUAL;

--ADD_MONTHS() : ��� ���� ��¥�� ���ϴ� �Լ�
--ADD_MONTHS(��¥������, ���ϰų� �� ������)

SELECT SYSDATE AS NOW
    , ADD_MONTHS(SYSDATE, -1) AS "1������"
  FROM DUAL;
  
--[��ȯ �� �Լ�]
--����ȯ ���� ����
--�Ͻ��� ����ȯ : �����ͺ��̽��� �ڵ����� ����ȯ�� ���ִ� ��

SELECT SALARY*'12'
  FROM EMPLOYEES;
  
--����� ����ȯ : ������ ��ȯ �� �Լ��� ����ؼ� ����ڰ� ���� �ڷ����� ���� ���ִ°�

--TO_CHAR : ��¥, ���� �����͸� ���� �����ͷ� ��ȯ���ִ� �Լ�
--TO_CHAR (��ȯ �� ������, ��� ����)

SELECT SALARY AS �޿�����
     , TO_CHAR(SALARY,'L999,999')
  FROM EMPLOYEES;
  
-- TO_NUMBER() : ���� �����͸� ���� �����ͷ� ��ȯ�ϴ� �Լ�
-- TO_NUMBER(���ڿ�������, �ν� �� ���� ����)
SELECT TO_NUMBER('1,000','9,999')+500 --�ν� �� ���� ���°� �� Ŀ�� ������
  FROM DUAL;
  
--TO_DATE() : ���� �����͸� ��¥ �����ͷ� ��ȯ�ϴ� �Լ�
--TO_DATE(���ڿ� ������, �ν� �� ��¥ ����)

SELECT TO_DATE('2024/05/31','YYYY-MM-DD')
  FROM DUAL;
  
-- [NULL ó�� �Լ�]
-- NVL() / NVL2() : NULL���� ��ü �� ��  �ִ� �Լ�
-- 1) NVL(NULL���� ���θ� �˻��� ������<1>,<1>�� NULL�� ��� ��ȯ�� ������)
-- 2) NVL2(NULL���� ���θ� �˻��� ������<1>,<1>�� NULL�� �ƴ� ��� ��ȯ�� ������<2>,<1>�� NULL�� ��� ��ȯ�� ������<3>)

SELECT FIRST_NAME ,DEPARTMENT_ID 
  FROM EMPLOYEES;
  
SELECT FIRST_NAME, DEPARTMENT_ID
     , NVL(DEPARTMENT_ID,0)
     , NVL2(DEPARTMENT_ID,'����','����')
  FROM EMPLOYEES;
  
--�������̺��� ���ʽ��� NULL�� ��� ���� 0���� ��ü�ؼ� ���
SELECT * FROM EMPLOYEES;

SELECT NVL(COMMISSION_PCT,0)
 FROM EMPLOYEES;

--�������̺��� ����ID, FIRST_NAME, MANAGER_ID�� ���
--�� �Ŵ����� �ִ� ������ '����'���� ���
--�Ŵ����� ���� ������ '��ǥ'�� ������ּ���!(NVL2���)

SELECT EMPLOYEE_ID,FIRST_NAME,NVL2(MANAGER_ID,'����','��ǥ')
  FROM EMPLOYEES;
  
-- [�����Լ�]
-- DECODE() : ��Ȳ�� ���� �ٸ� �����͸� ��ȯ�ϴ� �Լ�
--> �˻� ���� ���ؼ� ������ ���� ��ȯ
-- DECODE(�˻����� �� �÷� �Ǵ� ������<1, ���ذ�>, �� ��<2>
-- , ��ġ�� ��ȯ�� ��<3>, ��ġ���� ���� �� ��ȯ ��<������> )

--DEPARTMENT_ID �� NULL �̸� �μ�����, 90�̸� �μ�90, NULL�� �ƴϸ� �μ�����
SELECT FIRST_NAME, DEPARTMENT_ID
    , DECODE(DEPARTMENT_ID, NULL , '�μ�����', 90, '�μ�90', '�μ�����')
FROM EMPLOYEES;

--�������̺��� ����ID, FIRST_NAME, MANAGER_ID�� ���
--�� �Ŵ����� �ִ� ������ '����'���� ���
--�Ŵ����� ���� ������ '��ǥ'�� ������ּ���!(DECODE�Լ��� ���)

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
    ,DECODE(MANAGER_ID, NULL, '��ǥ', '����')
  FROM EMPLOYEES;
  
  
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
    ,DECODE(EMPLOYEE_ID, 100, '��ǥ',101,'�̻�',102,'����','����')
  FROM EMPLOYEES;