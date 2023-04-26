SELECT *
  FROM 직원
 WHERE 부서ID = 'D001'
    OR 부서ID = 'D002'
   AND 이름   = '김철수' ; --기본적으로 AND먼저 계산

SELECT * FROM 직원 ;

SELECT *
  FROM 직원
 WHERE (부서ID = 'D001' OR 부서ID = 'D002') --OR먼저 계산
   AND 이름   = '김철수' ; 

SELECT 직원ID
     , 연봉
     , 1
  FROM 직원 ;

SELECT 직원ID
     , 연봉
     , 1 AS 리터럴
  FROM 직원 ;
  
SELECT 직원ID
     , 연봉
     , 1000
     , 연봉 + 1000
  FROM 직원 ;
  
SELECT 직원ID
     , 연봉
     , 1000
     , 연봉 - 1000 AS 감봉
  FROM 직원 ;
  
SELECT 직원ID
     , 연봉
     , 연봉 * 0.1          AS 보너스
     , 연봉 + (연봉 * 0.1) AS 실수령액
  FROM 직원 ;

SELECT 직원ID
     , 연봉 || '에이비씨'
  FROM 직원 ;
  

SELECT 이름
     , 연봉
     , 이름 || ' 직원의 연봉은 ' || 연봉 || ' 만원 입니다.'
  FROM 직원 ;
  

SELECT LOWER('ABCDE123@@') AS LOWER사용
  FROM DUAL; --DUAL은 테스트 할 때 쓰는 테이블

SELECT 패스워드, UPPER(패스워드) AS UPPER한패스워드
  FROM 직원 ;
  
SELECT 패스워드
     , SUBSTR(패스워드,2,3) AS SUBSTR한패스워드 --SUBSTR(컬럼,START(시작값1),HOW)
  FROM  직원 ;

SELECT TRIM('   안녕하세요    '), TRIM(    '안 녕 하세요  ')
  FROM DUAL ;
  
--ex ) 사용자가 ' 01083470096' 입력하면 그대로 들어감.
--TRIM(' 01083470096')

SELECT TRIM(' 01082282828  ')FROM DUAL ;

--REPLACE(문자형리터럴1개 , 바뀔값 , 바꿀값) 
SELECT 주민등록번호
     , REPLACE(주민등록번호 , '-', '') AS 제외
  FROM 직원 ;

SELECT REPLACE('010-8347-0096' , '-' , '')  FROM DUAL ;


--1.
SELECT SUBSTR('https://smhrd.or.kr/', 9,5) 
  FROM DUAL ;
  
--2.
SELECT 직원ID
     , 주민등록번호
     , SUBSTR(주민등록번호, 1, 6 ) AS 생년월일
  FROM 직원 ;
  
--3.
SELECT 직원ID
     , 구분코드
     , 연락처
     , REPLACE(연락처 , '-', '')
  FROM 직원연락처 ;

--MOD (나머지)
SELECT 연봉
     , MOD(연봉, 1000)
  FROM 직원 ;
  
--ROUND(반올림)
--ROUND(숫자형 리터럴, 소수점 자릿수)

SELECT ROUND(1.452, 2)
     , ROUND(1.452, 1)
  FROM DUAL ;
  
--날짜형 함수
--SYSDATE
SELECT SYSDATE
  FROM DUAL ;
  
SELECT SYSDATE
     , SYSDATE + 1 AS 하루더함
     , SYSDATE + 1/24 AS 한시간더함
     , SYSDATE + 1/24/60 AS 일분더함
     , SYSDATE + 1/24/60/60 AS 일초더함
  FROM DUAL ;
  
--ADD_MONTHS(날짜형, 숫자형 리터럴) 숫자형리터럴 : 1당 1개월
SELECT 직원ID, 입사일시 FROM 직원 ;
SELECT 직원ID
     , 입사일시
     , ADD_MONTHS(입사일시, 60)
     , ADD_MONTHS(입사일시, -60)
  FROM 직원 ;
  

--4.
SELECT 직원ID
     , 입사일시
     , ADD_MONTHS(입사일시, 60) AS 오년후입사일시
  FROM 직원 ;
  
--5
SELECT SYSDATE + 3
  FROM DUAL ;


SELECT TO_NUMBER('1') FROM DUAL ; -- 문자형('1')을 숫자형(1) 로 형변환해 출력
SELECT TO_CHAR(1) FROM DUAL ; --숫자형(1)을 문자형('1') 로 형변환해 출력

--특정 포맷으로 바꿈 중요
SELECT TO_CHAR(SYSDATE , 'YYYY/MM/DD HH24:MI:SS') 
  FROM DUAL ;

SELECT TO_CHAR(SYSDATE , 'YYYY/MM/DD') 
  FROM DUAL ;
  

-- 포맷 
--YYYY : 연도4자리
--  MM : 월 2자리 (1월이라면 01)
--  DD : 일 2자리 (1일이라면 01, 20일이라면 20)
--HH24 : 시간을 의미 (24시간제) 0~23시
--  HH : 시간을 의미 (12시간제)
--  MI : 분(0~59)
--  SS : 초 (0~59) 
  
  
  
  
  
SELECT TO_DATE('20230101' , 'YYYY/MM/DD') FROM DUAL ; 
SELECT TO_DATE('20230101141212' , 'YYYY/MM/DD HH24:MI:SS') FROM DUAL; 