--CHAPTER 08. TCL(Transaction Control Language)

--Ʈ������̶�?
--�����ͺ��̽��� ���¸� ��ȭ��Ű�� ���ؼ� �����ϴ� �ּ� �������
-- �� ������ ó���ϱ� ���� �ּ� ���� �����̴�.

--Ʈ������� 4���� - AC ID ���
--Automicity(���ڼ�) : All or Nothing, ��� ������ �ǰų� ���� ������� �ʰų�
--Consistency(�ϰ���) : ������ �ϰ��� �ִ� ���·� �����ϴ� ��
--Isolastion(������) : Ʈ����� ����� �ٸ� Ʈ������� ������ ���� �ʴ� ��
--Durability(���Ӽ�) : ���������� ����� Ʈ������� ������ �ݿ��Ǵ� ��

--TCL ���ɾ�
--COMMIT : DB�� ���������� ����, ������ COMMIT ���� ������ Ʈ����� ����� ����
--ROLLBACK : Ʈ����� ���, ������ COMMIT ���������� ���� ����
--SAVEPOINT : �ϳ��� Ʈ������� �۰� �����Ͽ� �����ϴ� ����� �����ϴ� ���ɾ�

--���̺� ����
CREATE TABLE TCL_EMP AS SELECT * FROM EMPLOYEES;
--�������� PK,FK,������ ���� �ȵ�!
--������ �����͸� ���簡 ��!

SELECT * FROM TCL_EMP;

DELETE FROM TCL_EMP
WHERE EMPLOYEE_ID = 100;

ROLLBACK; -- �ǵ����� ���ɾ�

COMMIT;
ROLLBACK;

DELETE FROM TCL_EMP
 WHERE EMPLOYEE_ID = 101;
 
SELECT * FROM TCL_EMP;

COMMIT;

--�б� �ϰ����̶�?
--Ʈ������� �Ϸ�Ǳ� ������ �����͸� ���� �����ϴ� ����(SESSION) �ܿ�
--�ٸ� ���ǿ����� ������ ���� �� ������ ������ ��ȸ �����ϴ�.
--�� Ȯ���� �����͸� �˻��� �ȴ�.
-- �̰��� �б� �ϰ����� �����Ѵ� ��� �Ѵ�.

-- LOCK ��?
-- Ʈ�����ǿ��� �������� �����ʹ� Ʈ������� �Ϸ�(COMMIT,ROLLBACK)�� �Ǳ� ��������
-- �ٸ� ���ǿ����� �ش� �����͸� ������ �� ���� ����
-- �� �̻��� ������ ���� ���� �����Ϸ��� �� �� �浹�ϴ� ����

--���̺� ����
CREATE TABLE TCL_DEMP AS SELECT* FROM DEPARTMENTS;

SELECT * FROM TCL_DEMP;

UPDATE TCL_DEMP
SET DEPARTMENT_NAME = 'BIGDATE'
WHERE DEPARTMENT_ID= 100;

--�ΰ� ������ ������ ���� �� ���� �ٸ� ���ǿ��� ���� ���� �����ϰ� �Ǹ�
-- ���� ������ �ϰ� �Ǵ� ģ���� Ŀ���� �ϱ� ������ �۾��� ����

--�׷��� ���� �μ����� ���� �ϴµ� ���� Ŀ���� ���ϰ� ����� �ϸ�
--�ٸ� ����� �߱��� �ص� �ƹ��͵� �ݿ��� �ȵȴ�!

-- �׷��� Ŀ���� �� �ݿ� ����� �Ѵ�.