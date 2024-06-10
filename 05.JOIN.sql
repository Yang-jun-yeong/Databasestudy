--CHAPTER 05. JOIN 

-- JOIN : 여러 테이블에서 필요한 데이터를 한번에 가져오는 기술

-- 비등가 조인(NONE EQUI JOIN)
-->두 개의 테이블 간에 서로 정확하게 일치하지 않는 경우 활용하는 조인
--> 등가연산자(=)가 아닌 연산자들을 사용한 조인을 의미(>, >=, <, <=, BETWEEN)

-- 등가 조인
--> 두개의 테이블 간에 서로 정확하게 일치하는 경우 활용되는 조인
--> 등가연산자를 사용해서 조인을 의미(=)
--> 가장 많이 사용되는 조인이다.

--등가조인의 사용 방법
-- SELECT 테이블1.컬럼명1, 테이블2.컬럼명
--FROM 테이블1,테이블2 -- > 테이블1과 테이블2를 JOIN 하겠다.
--WHERE 테이블1.컬럼명 = 테이블2.컬럼명 ; --> 조인 조건을 기술

SELECT * FROM 수강생정보;
SELECT * FROM 성적표;

--수강생정보 테이블과 성적표 테이블에서 학생ID, 학생이름, 과목, 성적 순으로 출력

--1.조인할 대상 테이블의 정보확인
--2. FROM절에 조인할 테이블을 , (컴마) 기준으로 작성
--3. 조인 조건이 되는 특정 컬럼을 확인하여, WHERE 조건절에 조인 조건을 작성
--> 조인 조건이 되는 특정 컬럼 : 조인할 테이블 간에 같은 결과 값을 가지는 컬럼
--> 조인 조건이 되는 컬럼은 대부분 PK와 FK 관계로 이루어진다. 다만 전부 그런 것은 아니다.
--4. SELECT 절에 출력하고자 하는 컬럼 작성

SELECT A.학생ID, a.학생이름, B.과목, B.성적
  FROM 수강생정보 A, 성적표 B
  WHERE A.학생ID=B.학생ID;

--직원의 직원ID, FIST_NAME, DEPARTMENT_NAME(부서이름) 순으로 출력
SELECT * FROM EMPLOYEES;

--1.조인할 대상 테이블의 정보확인
--2. FROM절에 조인할 테이블을 , (컴마) 기준으로 작성
--3. 조인 조건이 되는 특정 컬럼을 확인하여, WHERE 조건절에 조인 조건을 작성
--> 조인 조건이 되는 특정 컬럼 : 조인할 테이블 간에 같은 결과 값을 가지는 컬럼
--> 조인 조건이 되는 컬럼은 대부분 PK와 FK 관계로 이루어진다. 다만 전부 그런 것은 아니다.
--4. SELECT 절에 출력하고자 하는 컬럼 작성

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
 FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID;
 
 --FROM절 별칭은 테이블1별칭1, 테이블2,별칭2
 --단 별칭 사용 이후 실행되는(SELECT,WHERE)절도 별칭만 사용해야 한다.
 
 
 --직원 ID가 100인 직원의 FIRST_NAME, 부서 이름을 출력
 SELECT A.EMPLOYEE_ID, A.FIRST_NAME, B.DEPARTMENT_NAME
    FROM EMPLOYEES A, DEPARTMENTS B
    WHERE (A.DEPARTMENT_ID = B.DEPARTMENT_ID)AND(A.EMPLOYEE_ID='100');
    
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- ANSI 조인문법 : 미국 표준협회에서 만든 모든 DBMS에서 사용가능한 조인 문법이다.

--INNER JOIN : 내부조인 이라고 하며, 조인 조건에서 동일한 값이 있는 행만 반환
-->EQUI(등가조인)과 동일한 내용이다!!

-- INNER JOIN의 사용 방법
-- 3. SELECT 컬럼명
-- 1. FROM 테이블1 INNER JOIN 테이블2 --> 테이블간 INNER JOIN하겠다.
--   ON  (테이블1.컬럼 = 테이블2.컬럼); -- 조인 조건을 기술
-- 2. WHERE 일반조건절 기술 -> 조인 조건 외 조건 기술

--직원테이블에서 직원 ID, 부서 ID, 부서테이블에서 부서이름을 출력(INNER JOIN)

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
  ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);
  
-- 조인할 테이블의 단독 컬럼이면 SELECT절에 .(경로)를 안적어줘도 상관은 없다.
-- 하지만 현업에서는 경로(.)를 적어주는 것이 좋다.
-- 조인 조건이 되는 컬럼은 PK와 FK관계로 거의 이루어진다.
-- 하지만 다 그런것은 아니다!!!

-- 직원ID,JOB_ID,JOB_TITLE의 정보를 순서대로 출력
 SELECT E.EMPLOYEE_ID, E.JOB_ID, J.JOB_TITLE
 FROM EMPLOYEES E INNER JOIN JOBS J
 ON (E.JOB_ID = J.JOB_ID);
 
 --INNER JOIN은 INNER라는 키워드를 생략도 가능하다!!
 
 --CROSS JOIN : 조인 조건절을 적지 않고 테이블의 모든 데이터를 가지고 오는 방법
 -- 조인 조건이 없는 경우 생길 수 있는 모든 데이터의 조합을 조회
 -- 카티션 곱 이라고 부른다.
 -- 카티션 곱: 모든 경우의 수가 나오는것
 
 -- 직원테이블의 직원ID, 부서ID
 -- 부서테이블의 부서이름을 출력 (CROSS JOIN)
 
 SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
   FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D;
-- CORSS JOIN은 CROSS라는 키워드를 생략할 수 있고 ON이 없다.

--> 직원테이블의 행(107)*부서테이블의 행(27) ==> 2889의 행이 출력
--> 카티션 곱이 발생(모든 경우의 수가 출력이 되는것)

-- OUTER JOIN : 외부조인이라고 하며, 두개의 테이블 간에 교집합을 조회하고
-- 한쪽 테이블에만 있는 데이터도 포함시켜서 조회하고 싶을 때 사용하는  조인 문법
--> 한쪽 데이터의  NULL값도 출력하고자 할 때 사용 하는 것

--LEFT OUTER JOIN : 왼쪽 테이블을 기준으로 Null값도 포함하여 출력
--오라클 문법 조인시 : 조인 조건절의 반대인 오른쪽 컬럼에(+) 기호를 작성

--RIGHT OUTER JOIN : 오른쪽 테이블을 기준으로 Null값도 포함하여 출력
--오라클 문법 조인시 : 조인 조건절에 반대인 왼쪽 컬럼에(+) 기호를 작성

-- FULL OUTER JOIN : 양쪽 NULL값도 포함하여 출력
-- 오라클 문법에선 지원을 하지 않는다. 단 UNION 연산자를 이용해서 같은 값을 출력하는 방법은 있음

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- 각 부서의 매니저 직원들의 부서 이름, 매니저 아이디, 이름을 출력(INNER JOIN)

--ANSI 표준문법
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.EMPLOYEE_ID = D.MANAGER_ID);

--오라클문법
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM EMPLOYEES E ,DEPARTMENTS D
    WHERE E.EMPLOYEE_ID = D.MANAGER_ID;
         
-- LEFT OUTER JOIN
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM DEPARTMENTS D  LEFT  JOIN  EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID);
    
-- 오라클 문법으로
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM DEPARTMENTS D  RIGHT OUTER JOIN  EMPLOYEES E
    ON E.EMPLOYEE_ID = D.MANAGER_ID;

--RIGHT OUTER JOIN
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM DEPARTMENTS D  RIGHT JOIN  EMPLOYEES E
    ON E.EMPLOYEE_ID = D.MANAGER_ID;

--오라클 문법으로
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID (+) = E.EMPLOYEE_ID;

--FULL OUTER JOIN
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.FIRST_NAME 
  FROM DEPARTMENTS D  FULL JOIN  EMPLOYEES E
    ON E.EMPLOYEE_ID = D.MANAGER_ID;
    
