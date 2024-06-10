--CHAPTER 05. JOIN 

-- JOIN : ���� ���̺��� �ʿ��� �����͸� �ѹ��� �������� ���

-- �� ����(NONE EQUI JOIN)
-->�� ���� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ���� �ʴ� ��� Ȱ���ϴ� ����
--> �������(=)�� �ƴ� �����ڵ��� ����� ������ �ǹ�(>, >=, <, <=, BETWEEN)

-- � ����
--> �ΰ��� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ�ϴ� ��� Ȱ��Ǵ� ����
--> ������ڸ� ����ؼ� ������ �ǹ�(=)
--> ���� ���� ���Ǵ� �����̴�.

--������� ��� ���
-- SELECT ���̺�1.�÷���1, ���̺�2.�÷���
--FROM ���̺�1,���̺�2 -- > ���̺�1�� ���̺�2�� JOIN �ϰڴ�.
--WHERE ���̺�1.�÷��� = ���̺�2.�÷��� ; --> ���� ������ ���

SELECT * FROM ����������;
SELECT * FROM ����ǥ;

--���������� ���̺�� ����ǥ ���̺��� �л�ID, �л��̸�, ����, ���� ������ ���

--1.������ ��� ���̺��� ����Ȯ��
--2. FROM���� ������ ���̺��� , (�ĸ�) �������� �ۼ�
--3. ���� ������ �Ǵ� Ư�� �÷��� Ȯ���Ͽ�, WHERE �������� ���� ������ �ۼ�
--> ���� ������ �Ǵ� Ư�� �÷� : ������ ���̺� ���� ���� ��� ���� ������ �÷�
--> ���� ������ �Ǵ� �÷��� ��κ� PK�� FK ����� �̷������. �ٸ� ���� �׷� ���� �ƴϴ�.
--4. SELECT ���� ����ϰ��� �ϴ� �÷� �ۼ�

SELECT A.�л�ID, a.�л��̸�, B.����, B.����
  FROM ���������� A, ����ǥ B
  WHERE A.�л�ID=B.�л�ID;

--������ ����ID, FIST_NAME, DEPARTMENT_NAME(�μ��̸�) ������ ���
SELECT * FROM EMPLOYEES;

--1.������ ��� ���̺��� ����Ȯ��
--2. FROM���� ������ ���̺��� , (�ĸ�) �������� �ۼ�
--3. ���� ������ �Ǵ� Ư�� �÷��� Ȯ���Ͽ�, WHERE �������� ���� ������ �ۼ�
--> ���� ������ �Ǵ� Ư�� �÷� : ������ ���̺� ���� ���� ��� ���� ������ �÷�
--> ���� ������ �Ǵ� �÷��� ��κ� PK�� FK ����� �̷������. �ٸ� ���� �׷� ���� �ƴϴ�.
--4. SELECT ���� ����ϰ��� �ϴ� �÷� �ۼ�

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
 FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID;
 
 --FROM�� ��Ī�� ���̺�1��Ī1, ���̺�2,��Ī2
 --�� ��Ī ��� ���� ����Ǵ�(SELECT,WHERE)���� ��Ī�� ����ؾ� �Ѵ�.
 
 
 --���� ID�� 100�� ������ FIRST_NAME, �μ� �̸��� ���
 SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_NAME
    FROM EMPLOYEES A, DEPARTMENTS B
    WHERE (A.DEPARTMENT_ID = B.DEPARTMENT_ID)AND(A.EMPLOYEE_ID='100');
    
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- ANSI ���ι��� : �̱� ǥ����ȸ���� ���� ��� DBMS���� ��밡���� ���� �����̴�.

--INNER JOIN : �������� �̶�� �ϸ�, ���� ���ǿ��� ������ ���� �ִ� �ุ ��ȯ
-->EQUI(�����)�� ������ �����̴�!!

-- INNER JOIN�� ��� ���
-- 3. SELECT �÷���
-- 1. FROM ���̺�1 INNER JOIN ���̺�2 --> ���̺� INNER JOIN�ϰڴ�.
--   ON  (���̺�1.�÷� = ���̺�2.�÷�); -- ���� ������ ���
-- 2. WHERE �Ϲ������� ��� -> ���� ���� �� ���� ���

--�������̺��� ���� ID, �μ� ID, �μ����̺��� �μ��̸��� ���(INNER JOIN)

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
  ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);
  
-- ������ ���̺��� �ܵ� �÷��̸� SELECT���� .(���)�� �������൵ ����� ����.
-- ������ ���������� ���(.)�� �����ִ� ���� ����.
-- ���� ������ �Ǵ� �÷��� PK�� FK����� ���� �̷������.
-- ������ �� �׷����� �ƴϴ�!!!

-- ����ID,JOB_ID,JOB_TITLE�� ������ ������� ���
 SELECT E.EMPLOYEE_ID, E.JOB_ID, J.JOB_TITLE
 FROM EMPLOYEES E INNER JOIN JOBS J
 ON (E.JOB_ID = J.JOB_ID);
 
 --INNER JOIN�� INNER��� Ű���带 ������ �����ϴ�!!
 
 --CROSS JOIN : ���� �������� ���� �ʰ� ���̺��� ��� �����͸� ������ ���� ���
 -- ���� ������ ���� ��� ���� �� �ִ� ��� �������� ������ ��ȸ
 -- īƼ�� �� �̶�� �θ���.
 -- īƼ�� ��: ��� ����� ���� �����°�
 
 -- �������̺��� ����ID, �μ�ID
 -- �μ����̺��� �μ��̸��� ��� (CROSS JOIN)
 
 SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
   FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D;
-- CORSS JOIN�� CROSS��� Ű���带 ������ �� �ְ� ON�� ����.

--> �������̺��� ��(107)*�μ����̺��� ��(27) ==> 2889�� ���� ���
--> īƼ�� ���� �߻�(��� ����� ���� ����� �Ǵ°�)

-- OUTER JOIN : �ܺ������̶�� �ϸ�, �ΰ��� ���̺� ���� �������� ��ȸ�ϰ�
-- ���� ���̺��� �ִ� �����͵� ���Խ��Ѽ� ��ȸ�ϰ� ���� �� ����ϴ�  ���� ����
--> ���� ��������  NULL���� ����ϰ��� �� �� ��� �ϴ� ��

--LEFT OUTER JOIN : ���� ���̺��� �������� Null���� �����Ͽ� ���
--����Ŭ ���� ���ν� : ���� �������� �ݴ��� ������ �÷���(+) ��ȣ�� �ۼ�

--RIGHT OUTER JOIN : ������ ���̺��� �������� Null���� �����Ͽ� ���
--����Ŭ ���� ���ν� : ���� �������� �ݴ��� ���� �÷���(+) ��ȣ�� �ۼ�

-- FULL OUTER JOIN : ���� NULL���� �����Ͽ� ���
-- ����Ŭ �������� ������ ���� �ʴ´�. �� UNION �����ڸ� �̿��ؼ� ���� ���� ����ϴ� ����� ����

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- �� �μ��� �Ŵ��� �������� �μ� �̸�, �Ŵ��� ���̵�, �̸��� ���(INNER JOIN)

--ANSI ǥ�ع���
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.EMPLOYEE_ID = D.MANAGER_ID);

--����Ŭ����
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM EMPLOYEES E ,DEPARTMENTS D
    WHERE E.EMPLOYEE_ID = D.MANAGER_ID;
         
-- LEFT OUTER JOIN
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM DEPARTMENTS D  LEFT  JOIN  EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID);
    
-- ����Ŭ ��������
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM DEPARTMENTS D  RIGHT OUTER JOIN  EMPLOYEES E
    ON E.EMPLOYEE_ID = D.MANAGER_ID;

--RIGHT OUTER JOIN
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM DEPARTMENTS D  RIGHT JOIN  EMPLOYEES E
    ON E.EMPLOYEE_ID = D.MANAGER_ID;

--����Ŭ ��������
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID (+) = E.EMPLOYEE_ID;

--FULL OUTER JOIN
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM DEPARTMENTS D  FULL JOIN  EMPLOYEES E
    ON E.EMPLOYEE_ID = D.MANAGER_ID;
    
