--CHAPTER 02. WHERE

--WHERE �� �⺻ �����
--SELECT ��ȸ�� �÷���1,...��ȸ�� �÷��� N
--  FROM ��ȸ�� ���̺� ��
-- WHERE ��ȸ�� ���� �����ϱ� ���� ���� ��
SELECT * FROM EMPLOYEES;

--�ǽ�) �������̺��� ���� ID�� 105�� ������ FIRST_NAME, LAST_NAME�� ���
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = 105;
  
--�ǽ�2) �μ����̺��� �Ŵ��� ���̵� 100�� �μ� �̸��� �μ� ���̵� ���
SELECT DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100;   
 
 --�ǽ�3) �������̺��� �޿��� 9000�� ������ ����ID, �����̸�, �޿������� ���
 SELECT EMPLOYEE_ID,FIRST_NAME,SALARY
   FROM EMPLOYEES
   WHERE SALARY = 9000;
   
DESC EMPLOYEES;

--��� ������<+,-,*,/>
--�񱳿�����[>(�ʰ�), >=(�̻�), <(�̸�), <=(����)]
--�������̺��� �޿��� 5000 ������ ������ �̸��� �޿� ������ ���
SELECT FIRST_NAME,SALARY
  FROM EMPLOYEES
 WHERE SALARY<=5000;

--���� ���̺��� ������ 50000 ������ �������� �̸��� ������ ���
SELECT FIRST_NAME as �̸�,SALARY*12 as ����
  FROM EMPLOYEES
  WHERE SALARY*12<=50000;
  
--� �� ������ (���� �ƴϸ� ���� �ʳ�)
-- = : ����
-- !=,<>,^= :���� �ʴ�.
-- NOT A = B : �����ʴ�.

--�ǽ�1)
SELECT * FROM EMPLOYEES;

--���� ���̺��� ���� ���̵� IT_PROG �ƴ� ������ �̸��� ���� ���̵� ���
SELECT FiRST_NAME,JOB_ID
  FROM EMPLOYEES
  WHERE JOB_ID ^= 'IT_PROG';
  
-- �������� (���̳� �ƴϸ� �����̳�)
-- 2�� �̻��� ������ ������ �̾��ִ� ������ �ϴ� �������Դϴ�.
--AND : ������ ��� �����ϴ� ��� TRUE ���� ��ȯ
--OR : �ϳ��� �����̶� �����ϸ� TRUE ���� ��ȯ

--�������̺��� �μ����̵� 90�̰� �޿��� 5000�� ������ ���̵�� �����̸��� ���
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID,FIRST_NAME,DEPARTMENT_ID,SALARY
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID=90 
   AND SALARY >=5000;

--�������̺��� �μ� ���̵� 100�̰ų� �Ի����� 06�� 02�� 02�� ���Ŀ� �Ի��� 
--������ �̸��� �Ի��� ������ ���
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID =100
   OR HIRE_DATE > '06/02/02';
   
--�������̺��� �μ� ID�� 100�̰ų� 90�� �����߿���
--���� ID�� 101�� ������ ����ID,�̸�,����
--�� ������ AnnSAL �̶�� ��Ī�� ����ؼ� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS AnnSAL , DEPARTMENT_ID
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = '101' AND (DEPARTMENT_ID = '100' OR DEPARTMENT_ID = '90'); 
  
--AND �����ڰ� OR �����ں��� �켱������ ���Ƽ� ������ �켱������ ����
--������� �޶�����. 

--NULL ���� ������
-- IS NULL: ������ ���� NULL�� ���� ��ȸ
-- IS NOT NULL: ������ ���� NULL�� �ƴ� ���� ��ȸ

--�������̺��� ���ʽ��� �ִ� ������ �̸��� ���ʽ� ������ ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME,COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;
 
SELECT DEPARTMENT_ID FROM EMPLOYEES;

--����!!) DEPARTMENT_ID�� ���� ������ �̸���?
SELECT FIRST_NAME
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IS NULL;
    
--SQL������
-->SQL���� ����� �� �ִ� ������
-- IN, BETWEEN, LIKE

-- IN: Ư�� �÷��� ���Ե� ������ �������� ��ȸ�� �� Ȱ��

--���� ���̺��� �μ�ID�� 30�̰ų� 50�̰ų� 90�� ������ ��� ������ ���
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID =30
   OR DEPARTMENT_ID =50
   OR DEPARTMENT_ID =90;
   
-- IN �����ڸ� Ȱ��
-- IN�� = + OR �� �� �����ִ�.
-- IN�� NULL ���� �ְ� �Ǹ� ���ܵǴ� Ư���� ������ �ִ�.
SELECT *
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID IN(30,50,90);
  
--���� ���̺��� �Ŵ��� ���̵� 100, 102, 103�� ������ �̸��� �Ŵ��� ���̵� ���
SELECT FIRST_NAME,MANAGER_ID
  FROM EMPLOYEES
  WHERE MANAGER_ID IN(100,102,103)
    OR MANAGER_ID IS NULL ;

-- NOT IN
-- ! + AND 
-- NOT IN�� ����� ���� NULL ���� �ְ� �Ǹ� ���� �ƿ� �ȳ��´�!.
-- IN �ڿ� ���ǿ� �ش����� �ʴ� �����͸� ���
--���� ���̺��� �Ŵ��� ���̵� 100,120,121�� �ƴ� ��������
-- �̸��� �Ŵ��� ���̵� ���

SELECT FIRST_NAME,MANAGER_ID
  FROM EMPLOYEES
  WHERE MANAGER_ID NOT IN(100,120,121);
    
--�ǽ�)�������̺��� �������̵� AD_VP�̰ų� ST_MAN�� ������ �̸��� ���� ���̵�
SELECT FIRST_NAME,EMPLOYEE_ID
  FROM EMPLOYEES
  WHERE JOB_ID IN ('AD_VP','ST_MAN');
  
-- �������̺��� �Ŵ��� ���̵� 145,146,147,148,149�� �ƴ� ������ �̸��� �Ŵ������̵� ���
SELECT FIRST_NAME,MANAGER_ID
  FROM EMPLOYEES
  WHERE MANAGER_ID NOT IN(145,146,147,148,149);
  
--BETWEEN A AND B
-- ���� ���� ���� �����͸� ��ȸ�Ҷ� ���
-- BETWEEN �ּڰ� AND �ִ밪
-- Ư�� �� ���� �ּ�, �ְ� ������ �����Ͽ� �ش� ���� ���� �����͸� ��ȸ
-- �������̺��� �޿��� 10000�̻� 20000������ ������ �̸��� �޿��� ������ ����ض�
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE 10000<= SALARY 
AND SALARY <=20000;

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 20000;

--�������̺��� 05�⿡ �Ի��� ������ �̸��� �Ի����� ���
SELECT FIRST_NAME,HIRE_DATE
FROM  EMPLOYEES
WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31';