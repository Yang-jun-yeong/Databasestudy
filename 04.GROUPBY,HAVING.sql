--CHAPTER 04. GROUP BY / HAVING

--내장함수의 종류
--단일행 함수: 입력된 하나의 행당 결과가 하나씩 나오는 함수
--> 문자형, 숫자형, 날짜형, 변환형, NULL관련 함수, 조건함수
--다중행 함수: 여러 행을 입력 받아서 하나의 결과 값으로 출력이 되는 함수
--다중행 함수(*집계함수*)라고 부른다.

--다중행 함수(집계함수)의 특징
--1. 집계함수는 NULL값을 제외하는 특성을 가지고 있다.
--2. 집계함수는 그룹화(GROUP BY)가 되어 있는 상태에서만 사용이 가능하다!

-- 집계함수의 종류
--COUNT() : 지정한 데이터의 개수 반환
--SUM() : 지정한 데이터의 합 변환
--MAX() : 지정한 데이터 중 최대값 반환
--MIN() : 지정한 데이터 중 최솟값 반환
--AVG() : 지정한 데이터 중 평균값 반환

--직원테이블에서 직원IN의 행의 개수를 조회
SELECT COUNT(EMPLOYEE_ID),EMPLOYEE_ID
  FROM EMPLOYEES
GROUP BY(EMPLOYEE_ID) ; --- 숨겨져 있음

-->EMPLOYEES 테이블을 하나의 그룹으로 묶은 것으로 인식을 하는 것

SELECT COUNT(EMPLOYEE_ID)  -- 1개의행
    ,EMPLOYEE_ID -- 107개의행
    FROM EMPLOYEES;
--> 출력하고자 하는 행의 개수가 맞지 않아서 에러가 난다.
--> 해결방법은 GROUP BY로 특정 컬럼을 그룹화 해줘야 된다!

--직원테이블에서 부서ID의 행의 갯수 조회
SELECT COUNT(DEPARTMENT_ID)
  FROM EMPLOYEES;

-- COUONT함수는 *(아스타리스크)를 사용할 수 있다
--> 다른 집계함수는 사용을 못한다.
--> *(아스타리스크)를 사용하면 NULL값까지 포함해서 출력을 해준다.

SELECT COUNT(*)
  FROM EMPLOYEES;
  
--도구 > 환경설정 > 코드편집기 > 행여백
  
--문제1) 직원테이블에서 급여의 총 합계를 출력 (SUM 함수를 사용)
SELECT SUM(SALARY)
  FROM EMPLOYEES;
--문제2) 직원테이블에서 직원들의 최대 급여와 최소 급여를 출력
SELECT MAX(SALARY),MIN(SALARY)
  FROM EMPLOYEES;
--문제3) 직원테이블에서 부서ID가 100인 직원의 평균 급여를 출력(AVG 함수)
--결과 값은 소수점 1의 자리 까지만출력
SELECT ROUND(AVG(SALARY),1)
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID =100;

SELECT*FROM 수강생정보;
SELECT*FROM 성적표;

SELECT 소속반, COUNT(소속반) AS 반별인원수
    FROM 수강생정보
GROUP BY 소속반;

--GROUP BY : 특정 컬럼을 기준으로 그룹화(묶음)

--4. SELECT   원하는컬럼명1,...
--1. FROM     조회할 테이블명
--2. WHERE    원하는 행을 선별하기 위한 조건식
--3. GROUP BY 특정 컬럼을 기준으로 그룹화

--수강생정보 테이블에서 소속반 별 학생의 인원수를 조회

SELECT 소속반, COUNT(학생ID)
  FROM 수강생정보
GROUP BY 소속반;

-- SQL의 작성 순서
-- SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY
--*** SQL 실행 순서***
--FROM > WHERE > GROUP BY> HAVING > SELECT > ORDER BY

--성적표 테이블에서 과목별로 최고 성적과 최저 성적을 출력

SELECT 과목, MAX(성적), MIN(성적) ,성적
  FROM 성적표
GROUP BY 과목,성적;

-- GROUP BY절을 사용할때 유의할 점
--1. 실제 출력되는 행이 감소하기 때문에 GROUP BY절보다 늦게 실행되는 절인
-- HAVING, SELECT, ORDER BY 절에는 출력할 수 있는 행이 제한이 된다.
--2. 대신 집계함수로 처리하는 컬럼은 사용이 가능하다!!

--성적표 테이블에서 학생별로 평균 점수를 출력
--단 소수점 1자리까지만 출력 가능
SELECT 학생ID, ROUND(AVG(성적),1)
  FROM 성적표
  GROUP BY 학생ID;
  
--성적표테이블에서 학생별로 JAVA와 DATABASE의 과목의 합만 출력
SELECT 학생ID, SUM(성적)
  FROM 성적표
  WHERE 과목 IN ('JAVA','DATABASE')
  GROUP BY 학생ID;
  
--HAVING절 : GROUP BY절이 존재 할 때만 사용이 가능합니다.
--> 집계가 완료된 대상을 조건을 통해 필터링 하는 문법
--> 조건이 참이 결과만 출력이 된다는 점에서 WHERE절과 비슷하지만,
--HAVING절은 그룹화(GROUP BY)된 대상에서 출력이 된다는 점에서 다르다.

-- 문제) 성적표 테이블에서 학생별 평균 성적을 구하고,
-- 평균 성적이 75 이하인 학생들만 출력

SELECT 학생ID,ROUND(AVG(성적),1)
  FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) <=75;

--수강생정보 테이블에서 소속반 별 인원수가 3명 이상인 반만 출력
SELECT 소속반, count(학생ID)
FROM 수강생정보
GROUP BY 소속반
HAVING  count(학생ID) >=3;

--직원테이블에서 부서별 최고 연봉이 100000 이상인 부서만 출력
SELECT * FROM EMPLOYEES;

SELECT DEPARTMENT_ID, MAX(SALARY*12) as 최고연봉
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY*12)>=100000;