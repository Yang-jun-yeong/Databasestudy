-- CHAPTER 01. SELECT
--주석 여러줄 : /**/
--글자 크기 키우기 : 도구 > 환경설정 > 코드편집기 > 글꼴
--주석 색 바꾸기 : 도구 > 환경설정 > 코드편집기 > PL/SQL 주석
/*
1.SQL문장에는 대소문자를 구분하지 않는다.
--2.띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3.SQL 문장 끝에는 반드시 세미클론(;)을 찍어주어야 한다.
4.SQL 실행 단축키 : ctrl + enter , F9
*/
select first_name from employees; 
SELECT FIRST_NAME
  FROM EMPLOYEES;
--직원 테이블에서 직원의 이메일 정보를 출력
SELECT EMAIL 
  FROM EMPLOYEES;
-- SELECT 절 기본 사용방법
-- 2. SELECT 조회할 컬럼명1, 조회할 컬럼명2,...조회할 컬럼명N
-- 1. FROM 조회할 테이블 이름

--직원 테이블에서 EMPLOYEE_ID, FIRST NAME, PHONE NUMBER, SALARY
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, SALARY
  FROM EMPLOYEES;
  
--* 곱하기
--select 절에 *를 쓰게되면 아스타리스크 라큰 와일드카드로 변한다.

--* (아스타리스크) -> 전체를 의미한다.
-- 직원테이블의 전체 정보를 출력하기
SELECT *
  FROM EMPLOYEES;
  
--부서 테이블의 전체 정보를 출력하고 행의 갯수가 몇개입니까? 27개
SELECT *
  FROM DEPARTMENTS;
  
-- 실습1) 직원테이블에서 직원 ID, FIRST_NAME, 매니저ID
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES;

-- 실습2) 부서테이블에서 부서ID, 부서명, 위치 ID
SELECT DEPARTMENT_ID , DEPARTMENT_NAME, LOCATION_ID
  FROM DEPARTMENTS

-- 실습3) 부서테이블에서 부서 ID 
SELECT DEPARTMENT_ID 
  FROM DEPARTMENTS;

--데이터 중복 제거하기
--DISTINCT : 데이터 중복 제거
--SELECT [DISTINCT/ALL]조회할 컬럼명
--  FROM 테이블명

--직원테이블에서 JOB_ID 컬럼의 중복을 제거하여 출력
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES;
  
--직원테이블에서 JOB_ID와 부서ID를 중복을 제거하여 출력
SELECT DISTINCT JOB_ID,DEPARTMENT_ID
  FROM EMPLOYEES;
-- DISTINCT 뒤에 2개 이상의 컬럼을 적게 되면
-- 한쪽 컬럼에 중복이 있더라도 다른 쪽의 컬럼 값이 다르다면 다르게 취급한다.

--TIP:
-->컬럼이 숫자라면 연산이 가능하다(+, -, *, /)

--직원 테이블에서 직원의 이름(FIRST_NAME, SALARY)
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES;
  
-- 직원의 이름과 급여와 연봉의 정보를 출력
SELECT FIRST_NAME, SALARY, (SALARY*12)
  FROM EMPLOYEES;
  
--별칭을 사용하기
--ALIAS 라고하며 하눈에 보기 좋게 설정할 수 있다.
--AS 키워드르 사용하여 별칭을 지정한다.

--별칭 사용방법
--1. SELECT 컬럼 별칭
--2. SELECT 컬럼 "별칭"
--3. SELECT 컬럼 AS 별칭
--4. SELECT 컬럼 AS "별칭"

SELECT FIRST_NAME AS 이름, SALARY*12 AS "ANNSAL"
  FROM EMPLOYEES;
  
-- 직원테이블에서 직원의 이름과 입사일(HIRE_DATE) 입사일다음날(별칭:입사일다음날)의 정보를 출력
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, HIRE_DATE, HIRE_DATE+1 AS "입사일다음날"
  FROM EMPLOYEES;
  
--ORDER BY 절
-- 특정 컬럼을 기준으로 정렬된 상태로 출력하고자 할 떄 사용한다.
-- SQL실행순서에서 가장 마지막에 실행된다.
-- 별도의 정렬방식을 지정하지 않으면 기본적으로 오름차순(ASC)이 적용된다.
--정렬방식
--ASC(Ascending) : 오름차순
--DESC(Descending) : 내림차순

DESC EMPLOYEES ;
--DESC (DESCRIBE)
--테이블 구조를 확인하는 명령어

--직원테이블에서 모든 직원의 정보를 출력하는데 급여 기준으로 오름차순으로 정렬하여 출력
SELECT *
  FROM EMPLOYEES
ORDER BY SALARY ASC ;

--직원 테이블에서 최근에 입사한 날짜를 기준으로 직원의 이름과 입사 날짜를 출력
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

--직원 테이블에서 직원 ID, 부서ID, 이름, 급여 순으로 출력
--단 부서 ID는 오름차순으로 정렬, 급여는 내림차순으로 정렬

SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC , SALARY DESC;

--같은 부서에서 근무하고 있는 직원들끼리 급여가 높은 순서대로 출력
-->먼저 부서 아이디를 오름차순으로 정렬한 후에 급여를 내림차순으로 순차적 정렬

--NULL 이란?
--NULL 값이란 데이터의 값이 완전히 비어있는 상태를 말한다.
--값이 존재하지 않거나 정해지지 않은 것을 의미합니다.
--숫자 0과 문자열''은 NULL값이 아니다.
--NULL과 연산을 하면 결과 값은 무조건 NULL값이 나온다.
--NULL과 비교를 하면 결과 값은 무조건 FALSE가 나온다.

--직원 테이블에서 직원 ID,보너스, 보너스2배 정보를 출력하면된다.
SELECT *
  FROM EMPLOYEES;
  
SELECT EMPLOYEE_ID, COMMISSION_PCT, (COMMISSION_PCT*2)
  FROM EMPLOYEES;
  
--보너스두배의 정보는 UP_BONUS로 별칭
SELECT (COMMISSION_PCT*2) AS "UP_BONUS"
  FROM EMPLOYEES;

--NULL 값은 완전히 비어있는 상태를 의미하기 떄문에 
--NULL 값은 연산자체가 불가능하기 때문에 결과값이 무조건 NULL이 나오기 떄문이다.
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = 105;

SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT*2 AS "UP_BONUS"
  FROM EMPLOYEES;  