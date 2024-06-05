--CHAPTER 03. 오라클 함수
--함수(Function) 란?
-- 입력 값을 넣어 특정한 기능을 통해 결과 값을 출력

--사용자 정의함수: 사용자가 필요에 의해 직접 정의한 함수
-- 내장 함수 : 오라클에서 미리 만들어 놓은 함수, 필요할 때마다 호출해서 사용
-- 내장함수는 문자형, 숫자형, 날짜형, 변환형, NULL관련 함수, 조건함수 

--함수() : *소괄호필수*
-- 함수를 실행할 떄 사용하는 입력 값 : 매개변수, 인자 값

--[문자형 함수]
--UPPER{} : 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력
--LOWER{} : 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력

SELECT UPPER('abced123@@')
    FROM DUAL;
--DUAL 테이블이란?
--임시 연산이나 함수의 결과 값 확인 용도로 사용하는 테스트용 테이블입니다.

SELECT * FROM EMPLOYEES;
--직원 테이블에서 직원의 FIRST_NAME을 모두 대문자로
--직원의 EMAIL정보를 모두 소문자로 모두 출력하세요.

SELECT UPPER(FIRST_NAME) ,LOWER(EMAIL)
  FROM EMPLOYEES;
  
--LENGTH() : 괄호 안 문자 데이터의 길이를 구하는 함수
SELECT LENGTH('HELLO WORLD')
  FROM DUAL;

--직원테이블에서 직원의 FIRST_NAME을 출력, FIRST_NAME길이도 출력
SELECT FIRST_NAME, LENGTH(FIRST_NAME) 
 FROM EMPLOYEES;

--직원의 FIRST_NAME의 길이가 5인 이상의 직원들의 직원 ID, 이름 출력
SELECT EMPLOYEE_ID,FIRST_NAME,LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME)>=5;

--SUBSTR() : 문자열을 추출하는 함수
--1) SUBSTR(입력, 시작위치, 추출길이)
--문자열 데이터의 시작위치부터 추출길이 만큼 출력
--2) SUBSTR(입력값, 시작위치)
-- 추출길이 생략시 문자열 데이터의 시작위치부터 끝까지 출력

SELECT SUBSTR('인공지능사관학교',3,2) AS 지능
, SUBSTR('인공지능사관학교',1,4) AS 인공지능
, SUBSTR('인공지능사관학교',5) AS 사관학교
  FROM DUAL;

SELECT HIRE_DATE FROM EMPLOYEES;

--입사날짜를 연도, 월, 일 별로 잘라서 출력
--각 컬럼에는 연도, 월, 일 별로 별칭을 사용해서 출력
SELECT SUBSTR(HIRE_DATE,1,2)AS 연, SUBSTR(HIRE_DATE,4,2)AS 월, SUBSTR(HIRE_DATE,7)AS 일
FROM EMPLOYEES;

--REPLACE() : 특정 문자를 다른 문자로 바꾸어 주는 함수
--1) REPLACE(문자열데이터, 바꾸고 싶은 문자, 바꿔야할 문자)
--2) REPLACE(문자열데이터, 바꾸고 싶은 문자)
--바꿔야 하는 문자를 생략 시 바꾸고 싶은 문자는 문자열 데이터에서 삭제가 된다)
SELECT REPLACE('인공지능##사관학교','#','')
 FROM DUAL;
 
--직원테이블에서 입사날짜를 출력하되
--/(슬러시) 문자열을 -(하이픈)으로 바꿔서 출력
--/(슬러시) 문자열을 삭제하여 출력 해주세요

SELECT * FROM EMPLOYEES;
SELECT REPLACE(HIRE_DATE,'/','-'),REPLACE(HIRE_DATE,'/')
  FROM EMPLOYEES;
  
--CONCAT() : 두 문자열 데이터를 합치는 함수
-- 매개변수로 2개만 들어갈 수 있고, 2개의 문자열만 합치는 함수
-- 합성연산자 "||"를 이용하면 무한대로 문자열 연결이 가능하다.

SELECT  CONCAT('인공지능','사관학교')||' 최고'||' 광주'||'코딩 학교'
  FROM DUAL;
  
--TRIM(): 입력 받은 문자형 데이터의 양 끝의 공백을 제거한다.
SELECT REPLACE(TRIM('        여러분은 최고입니다          '),' ')
  FROM DUAL;
  
--[숫자형함수]
--ROUND() :  특정 위치에서 반올림 하는 함수
--1) ROUND(반올림 할 숫자, 반올림 위치)
--반올림 위치 생략시 소수점 첫째 자리에서 강제로 반올림 수행
SELECT ROUND(123.45678)
  FROM DUAL;
  
--TRUNC() : 특정 위치에서 버리는 함수
--TRUNC(버림할 숫자, 버림위치)
--TRUNC(버림할 숫자)
--버림 위치 생략시 소수점 첫 번째 자리에서 강제로 버림 수행

SELECT TRUNC(123.456789)
  FROM DUAL;
  
--MOD() : 숫자를 나눈 나머지 값을 구하는 함수
--MOD(나눗셈 될 숫자, 나눌 숫자)
--홀수,짝수를 구분할 때 유용하게 사용한다.

SELECT MOD(10,2) AS "0"
, MOD(10,3) AS "1"
, MOD(15,6) AS "3"
 FROM DUAL;
 
--[날짜형 함수]

--SYSDATE : 현재 날짜와 시간을 출력해주는 함수
-- 입력시 바로 출력이 되며, 현재 시간을 초단위까지 출력이 가능하다.
-- 날짜형 함수는 연산이 가능하다.
-- 날짜형 데이터 끼리는 연산이 불가능하다.

SELECT SYSDATE
  FROM DUAL;
  
--날짜형식 셋팅
--도구 > 환경설정> 데이터베이스> NLS >날짜형식 >YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE AS "현재"
    ,SYSDATE -1 AS 어제의날짜
    ,SYSDATE +1 AS 내일의날짜
    --SYSDATE+SYSDATE ->날짜 데이터끼리는 연산이 불가능하다!.
  FROM DUAL;
  
--날짜데이터활용(실무)
SELECT SYSDATE AS 현재
        ,SYSDATE+1 AS 하루더함
        ,SYSDATE+1/24 AS 한시간더함
        ,SYSDATE+1/24/60 AS 일분더함
        ,SYSDATE+1/24/60/60 AS 일초더함
FROM DUAL;

--ADD_MONTHS() : 몇개월 이후 날짜를 구하는 함수
--ADD_MONTHS(날짜데이터, 더하거나 뺄 개월수)

SELECT SYSDATE AS NOW
    , ADD_MONTHS(SYSDATE, -1) AS "1개월전"
  FROM DUAL;
  
--[변환 형 함수]
--형변환 형태 종류
--암시적 형변환 : 데이터베이스가 자동으로 형변환을 해주는 것

SELECT SALARY*'12'
  FROM EMPLOYEES;
  
--명시적 형변환 : 데이터 변환 형 함수를 사용해서 사용자가 직접 자료형을 지정 해주는것

--TO_CHAR : 날짜, 숫자 데이터를 문자 데이터로 변환해주는 함수
--TO_CHAR (변환 할 데이터, 출력 형태)

SELECT SALARY AS 급여정보
     , TO_CHAR(SALARY,'L999,999')
  FROM EMPLOYEES;
  
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환하는 함수
-- TO_NUMBER(문자열데이터, 인식 될 숫자 형태)
SELECT TO_NUMBER('1,000','9,999')+500 --인식 될 숫자 형태가 더 커도 괜찮음
  FROM DUAL;
  
--TO_DATE() : 문자 데이터를 날짜 데이터로 변환하는 함수
--TO_DATE(문자열 데이터, 인식 될 날짜 형태)

SELECT TO_DATE('2024/05/31','YYYY-MM-DD')
  FROM DUAL;
  
-- [NULL 처리 함수]
-- NVL() / NVL2() : NULL값을 대체 할 수  있는 함수
-- 1) NVL(NULL인지 여부를 검사할 데이터<1>,<1>이 NULL일 경우 반환할 데이터)
-- 2) NVL2(NULL인지 여부를 검사할 데이터<1>,<1>이 NULL이 아닐 경우 반환할 데이터<2>,<1>이 NULL일 경우 반환할 데이터<3>)

SELECT FIRST_NAME ,DEPARTMENT_ID 
  FROM EMPLOYEES;
  
SELECT FIRST_NAME, DEPARTMENT_ID
     , NVL(DEPARTMENT_ID,0)
     , NVL2(DEPARTMENT_ID,'있음','없음')
  FROM EMPLOYEES;
  
--직원테이블에서 보너스가 NULL인 경우 숫자 0으로 대체해서 출력
SELECT * FROM EMPLOYEES;

SELECT NVL(COMMISSION_PCT,0)
 FROM EMPLOYEES;

--직원테이블에서 직원ID, FIRST_NAME, MANAGER_ID를 출력
--단 매니저가 있는 직원은 '직원'으로 출력
--매니저가 없는 직원은 '대표'로 출력해주세요!(NVL2사용)

SELECT EMPLOYEE_ID,FIRST_NAME,NVL2(MANAGER_ID,'직원','대표')
  FROM EMPLOYEES;
  
-- [조건함수]
-- DECODE() : 상황에 따라 다른 데이터를 반환하는 함수
--> 검사 대상과 비교해서 지정한 겂을 반환
-- DECODE(검사대상이 될 컬럼 또는 데이터<1, 기준값>, 비교 값<2>
-- , 일치시 반환할 값<3>, 일치하지 않을 때 반환 값<마지막> )

--DEPARTMENT_ID 가 NULL 이면 부서없음, 90이면 부서90, NULL이 아니면 부서있음
SELECT FIRST_NAME, DEPARTMENT_ID
    , DECODE(DEPARTMENT_ID, NULL , '부서없음', 90, '부서90', '부서있음')
FROM EMPLOYEES;

--직원테이블에서 직원ID, FIRST_NAME, MANAGER_ID를 출력
--단 매니저가 있는 직원은 '직원'으로 출력
--매니저가 없는 직원은 '대표'로 출력해주세요!(DECODE함수를 사용)

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
    ,DECODE(MANAGER_ID, NULL, '대표', '직원')
  FROM EMPLOYEES;
  
  
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
    ,DECODE(EMPLOYEE_ID, 100, '대표',101,'이사',102,'팀장','직원')
  FROM EMPLOYEES;