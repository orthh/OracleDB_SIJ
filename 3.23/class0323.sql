SELECT 소속반
     , COUNT(*) AS 인원수
  FROM 수강생정보
 GROUP BY 소속반 ;
 
SELEcT * FROM 성적표 ;
 
 --실행순서
SELECT 학생ID
     , COUNT(*) -- * 의 의미 : NULL 포함한 집계
     , COUNT(성적)  -- NULL 제외한 집계
  FROM 성적표 --1
 GROUP BY 학생ID ; --2 . 학생ID기준으로 묶음.
 
SELECT COUNT(*)
  FROM 성적표 ;
  -- 위 아래 같음
SELEcT COUNT(*)
  FROM 성적표 
 GROUP BY();
 
SELECT MAX(연봉) FROM 직원 ;
SELECT MIN(입사일시) FROM 직원 ;
SELECT MAX(입사일시) FROM 직원 ;

--집계함수는 기본적으로 NULL 무시
SELECT 학생ID
     , ROUND(AVG(성적),1) --ROUND(숫자 , 소수점자릿수) 
  FROM 성적표
 GROUP BY 학생ID ; --GROUP BY 속성 으로 그루핑(GROUPING)함, 집계함수(컬럼)그루핑한 
                  --거를 기준으로 집계함수 실행
                  
--실습1
-- 왠만하면 GROUP BY에 작성된 컬럼만사용가능.
SELECT 학생ID
     , ROUND(AVG(성적),1) AS 평균성적
  FROM 성적표
 GROUP BY 학생ID ;
 
--실습2
SELECT MAX(연봉) AS 최고연봉
     , MIN(연봉) AS 최저연봉
  FROM 직원
 GROUP BY();
  
--실습3
SELECT 소속반
     , COUNT(소속반) AS 반별인원수
  FROM 수강생정보
 GROUP BY 소속반 ;
     
--실습4
SELECT 학생ID 
     , ROUND(AVG(성적),1) AS 수학제외한평균
  FROM 성적표
 WHERE 과목 NOT IN '수학' 
 GROUP BY 학생ID ;
 
--실습5
SELECT * FROM 직원 ;
SELECT 부서ID
     , SUM(연봉) AS 부서별연봉합계
  FROM 직원
 GROUP BY 부서ID
 ORDER BY 부서ID ;
 
--실습6
SELECT A.직원ID
     , COUNT(B.연락처) AS 연락처개수
  FROM 직원 A
     , 직원연락처 B
 WHERE A.직원ID = B.직원ID(+)
 GROUP BY A.직원ID
 ORdER BY A.직원ID ;
 
--놀이터
SELECT * FROM 직원 ;
--직원테이블에서 남자,여자 인원수 구하기
SELECT 성별
     , COUNT(성별) AS 인원수
  FROM 직원
 GROUP BY 성별 ;

--HAVING
--HAVING문법은 집계가 완료된 대상을 필터링 하는 문법
SELECT 학생ID, ROUND(AVG(성적),1) AS 평균성적
  FROM 성적표
 GROUP BY 학생ID 
 HAVING AVG(성적) <= 75 
 ORDER BY 학생ID ;
 
--HAVING은 집계함수에 조건줄수있다.
--WHERE은 집계함수에 조건줄수없다.

SELECT 학생ID
     , ROUND(AVG(성적),1) AS 평균성적
  FROM 성적표 --순서 : 1
 GROUP BY 학생ID  --순서:3 
 WHERE AVG(성적) <= 75 --error  -- 순서 :2
 ORDER BY 학생ID ;
 
 --실습1
 SELECT 소속반
      , COUNT(소속반) AS 인원수
   FROM 수강생정보
  GROUP BY 소속반
 HAVING COUNT(소속반) >= 3
  ORDER BY 소속반 ;
 
--실습2
SELECT 부서ID
     , MAX(연봉) AS 최고연봉
  FROM 직원 
 GROUP BY 부서ID
 HAVING MAX(연봉) = 7500
 ORDER BY 부서ID ;

--실습3
SELECT 학생ID
     , ROUND( AVG(성적) , 1) AS 평균성적
  FROM 성적표
 GROUP BY 학생ID
 HAVING AVG(성적) IS NOT NULL 
 ORDER BY(학생ID) ;
 
---놀이터---
SELECT * FROM 직원 ;

--ORDER BY 기본적으로 ASC(오름차순 정렬)
SELECT * 
  FROM 직원
 ORDER BY 이름;

--내림차순 : DESC
SELECT * 
  FROM 직원
 ORDER BY 이름 DESC ;

SELECT *
  FROM 직원
 ORDER BY 부서ID, 이름 DESC ; 
 --부서ID를 기준으로 오름차순 정렬을 하되, 이름은 내림차순 정리하겠다.

SELECT 직원ID
     , 이름
     , 연봉 AS 직원들의연봉
     , 연봉 * 0.1 AS 보너스
  FROM 직원
 ORDER BY 3 ; --직원ID : 1, 이름 : 2, 직원들의연봉 : 3 ... 3이므로 직원들의연봉을
              --오름차순 (default ASC) 정렬하겠다.
              
SELECT 직원ID
     , 이름
     , 연봉 AS 직원들의연봉
     , 연봉 * 0.1 AS 보너스
  FROM 직원
 ORDER BY 직원들의연봉 ; --ORDER BY는 SELECT보다 늦게 실행되므로 가능


--DML
--INSERT
INSERT INTO 직원 (
       직원ID
     , 패스워드
     , 이름
     , 성별
     , 나이
     , 입사일시
     , 주민등록번호
     , 부서ID
) VALUES (
       'A0012'
     , 'pass1234'
     , '강감찬'
     , '남'
     , 31
     , SYSDATE
     , '930911-1255231'
     , 'D001'
) ;
--Primary KEY 에는NULL 불가, 중복x

INSERT INTO 직원  --모든 컬럼 써주면 생략도 가능 실무에서 잘 안씀.
VALUES (
'A0014' 
, 'hipasswd'
, '공손한'
, '여'
, 50
, sysdate
, '740922-2555111'
, 7000
, 'D002'
) ; 

select * from 직원 ;

COMMIT ;

SELECT 직원ID, 이름, 연봉 FROM 직원 ;

ROLLBACK ; 
UPDATE 직원
   SET 연봉 = 9999
 WHERE 직원ID = 'A0001' ;

COMMIT ;