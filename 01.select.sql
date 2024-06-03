-- CHAPTER 01. SELECT
--�ּ� ������ : /**/
--���� ũ�� Ű��� : ���� > ȯ�漳�� > �ڵ������� > �۲�
--�ּ� �� �ٲٱ� : ���� > ȯ�漳�� > �ڵ������� > PL/SQL �ּ�
/*
1.SQL���忡�� ��ҹ��ڸ� �������� �ʴ´�.
--2.���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
3.SQL ���� ������ �ݵ�� ����Ŭ��(;)�� ����־�� �Ѵ�.
4.SQL ���� ����Ű : ctrl + enter , F9
*/
select first_name from employees; 
SELECT FIRST_NAME
  FROM EMPLOYEES;
--���� ���̺��� ������ �̸��� ������ ���
SELECT EMAIL 
  FROM EMPLOYEES;
-- SELECT �� �⺻ �����
-- 2. SELECT ��ȸ�� �÷���1, ��ȸ�� �÷���2,...��ȸ�� �÷���N
-- 1. FROM ��ȸ�� ���̺� �̸�

--���� ���̺��� EMPLOYEE_ID, FIRST NAME, PHONE NUMBER, SALARY
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, SALARY
  FROM EMPLOYEES;
  
--* ���ϱ�
--select ���� *�� ���ԵǸ� �ƽ�Ÿ����ũ ��ū ���ϵ�ī��� ���Ѵ�.

--* (�ƽ�Ÿ����ũ) -> ��ü�� �ǹ��Ѵ�.
-- �������̺��� ��ü ������ ����ϱ�
SELECT *
  FROM EMPLOYEES;
  
--�μ� ���̺��� ��ü ������ ����ϰ� ���� ������ ��Դϱ�? 27��
SELECT *
  FROM DEPARTMENTS;
  
-- �ǽ�1) �������̺��� ���� ID, FIRST_NAME, �Ŵ���ID
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES;

-- �ǽ�2) �μ����̺��� �μ�ID, �μ���, ��ġ ID
SELECT DEPARTMENT_ID , DEPARTMENT_NAME, LOCATION_ID
  FROM DEPARTMENTS

-- �ǽ�3) �μ����̺��� �μ� ID 
SELECT DEPARTMENT_ID 
  FROM DEPARTMENTS;

--������ �ߺ� �����ϱ�
--DISTINCT : ������ �ߺ� ����
--SELECT [DISTINCT/ALL]��ȸ�� �÷���
--  FROM ���̺��

--�������̺��� JOB_ID �÷��� �ߺ��� �����Ͽ� ���
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES;
  
--�������̺��� JOB_ID�� �μ�ID�� �ߺ��� �����Ͽ� ���
SELECT DISTINCT JOB_ID,DEPARTMENT_ID
  FROM EMPLOYEES;
-- DISTINCT �ڿ� 2�� �̻��� �÷��� ���� �Ǹ�
-- ���� �÷��� �ߺ��� �ִ��� �ٸ� ���� �÷� ���� �ٸ��ٸ� �ٸ��� ����Ѵ�.

--TIP:
-->�÷��� ���ڶ�� ������ �����ϴ�(+, -, *, /)

--���� ���̺��� ������ �̸�(FIRST_NAME, SALARY)
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES;
  
-- ������ �̸��� �޿��� ������ ������ ���
SELECT FIRST_NAME, SALARY, (SALARY*12)
  FROM EMPLOYEES;
  
--��Ī�� ����ϱ�
--ALIAS ����ϸ� �ϴ��� ���� ���� ������ �� �ִ�.
--AS Ű���帣 ����Ͽ� ��Ī�� �����Ѵ�.

--��Ī �����
--1. SELECT �÷� ��Ī
--2. SELECT �÷� "��Ī"
--3. SELECT �÷� AS ��Ī
--4. SELECT �÷� AS "��Ī"

SELECT FIRST_NAME AS �̸�, SALARY*12 AS "ANNSAL"
  FROM EMPLOYEES;
  
-- �������̺��� ������ �̸��� �Ի���(HIRE_DATE) �Ի��ϴ�����(��Ī:�Ի��ϴ�����)�� ������ ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, HIRE_DATE, HIRE_DATE+1 AS "�Ի��ϴ�����"
  FROM EMPLOYEES;
  
--ORDER BY ��
-- Ư�� �÷��� �������� ���ĵ� ���·� ����ϰ��� �� �� ����Ѵ�.
-- SQL����������� ���� �������� ����ȴ�.
-- ������ ���Ĺ���� �������� ������ �⺻������ ��������(ASC)�� ����ȴ�.
--���Ĺ��
--ASC(Ascending) : ��������
--DESC(Descending) : ��������

DESC EMPLOYEES ;
--DESC (DESCRIBE)
--���̺� ������ Ȯ���ϴ� ��ɾ�

--�������̺��� ��� ������ ������ ����ϴµ� �޿� �������� ������������ �����Ͽ� ���
SELECT *
  FROM EMPLOYEES
ORDER BY SALARY ASC ;

--���� ���̺��� �ֱٿ� �Ի��� ��¥�� �������� ������ �̸��� �Ի� ��¥�� ���
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

--���� ���̺��� ���� ID, �μ�ID, �̸�, �޿� ������ ���
--�� �μ� ID�� ������������ ����, �޿��� ������������ ����

SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC , SALARY DESC;

--���� �μ����� �ٹ��ϰ� �ִ� �����鳢�� �޿��� ���� ������� ���
-->���� �μ� ���̵� ������������ ������ �Ŀ� �޿��� ������������ ������ ����

--NULL �̶�?
--NULL ���̶� �������� ���� ������ ����ִ� ���¸� ���Ѵ�.
--���� �������� �ʰų� �������� ���� ���� �ǹ��մϴ�.
--���� 0�� ���ڿ�''�� NULL���� �ƴϴ�.
--NULL�� ������ �ϸ� ��� ���� ������ NULL���� ���´�.
--NULL�� �񱳸� �ϸ� ��� ���� ������ FALSE�� ���´�.

--���� ���̺��� ���� ID,���ʽ�, ���ʽ�2�� ������ ����ϸ�ȴ�.
SELECT *
  FROM EMPLOYEES;
  
SELECT EMPLOYEE_ID, COMMISSION_PCT, (COMMISSION_PCT*2)
  FROM EMPLOYEES;
  
--���ʽ��ι��� ������ UP_BONUS�� ��Ī
SELECT (COMMISSION_PCT*2) AS "UP_BONUS"
  FROM EMPLOYEES;

--NULL ���� ������ ����ִ� ���¸� �ǹ��ϱ� ������ 
--NULL ���� ������ü�� �Ұ����ϱ� ������ ������� ������ NULL�� ������ �����̴�.
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = 105;

SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT*2 AS "UP_BONUS"
  FROM EMPLOYEES;  