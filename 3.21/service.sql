SELECT TO_NUMBER('1') FROM DUAL ; -- 문자형('1')을 숫자형(1) 로 형변환해 출력
SELECT TO_CHAR(1) FROM DUAL ; --숫자형(1)을 문자형('1') 로 형변환해 출력
SELECT TO_CHAR(SYSDATE , 'YYYY/MM/DD HH24:MI:SS') FROM DUAL ; 
SELECT TO_DATE('20230101' , 'YYYY/MM/DD') FROM DUAL ; 
SELECT TO_DATE('20230101141212' , 'YYYY/MM/DD HH24:MI:SS') FROM DUAL;

--등록일자 (문자형 8자리로 넣는다. YYYYMMDD)
SELECT SYSDATE
  FROM DUAL ;
  
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') 
  FROM DUAL ;
  
SELECT TO_DATE('20230101' , 'YYYY/MM/DD') FROM DUAL ;

--실습1
SELECT 직원ID
     , 입사일시
     , TO_CHAR(입사일시, 'YYYY') AS 입사연도  --입사일시 : DATE타입 , to_char
  FROM 직원 ;
  

--문자열 + 숫자
SELECT 이름 + 1000 --에러 
  FROM 직원 ;

--위 아래 같은에러 날짜 > 숫자 > 문자
SELECT TO_NUMBER(이름) + 1000 FROM 직원 ;

SELECT '1' + 1 FROM DUAL ; --2 
--위에거 쓰면 아래로 자동 형변환이됨
SELECT TO_NUMBER('1') + 1 FROM DUAL ;

SELECT 이름 + 성별
  FROM 직원 ; -- 에러 || 사용
  
SELECT * FROM 직원 ;

SELECT 직원ID
     , 나이
     , NVL(나이, 0) + 20 AS 수정나이
  FROM 직원 ;
  
SELECT 직원ID
     , 나이
     , NVL2(나이, 나이, 0)
  FROM 직원 ;
  
SELECT 직원ID
     , 부서ID
     , DECODE(부서ID, 'D001', 'ok', 'no')
  FROM 직원 ;
  
SELECT COALESCE(NULL, NULL, NULL, 1, NULL) 
  FROM DUAL ;
  
SELECT COALESCE(5, NULL, NULL, 1, NULL) 
  FROM DUAL;
  
--1
SELECT NVL(NULL, '1') FROM DUAL; --1

--2
SELECT COALESCE(NULL, NULL, '2') FROM DUAL ; --2

--3
SELECT NVL('1','5') FROM DUAL ; --1


--실습1
SELECT 직원ID
     , 패스워드
     , NVL(나이, 20) AS 나이
  FROM 직원 ;
  
--실습2
SELECT 직원ID
     , 성별
     , 연봉
     , DECODE(성별, '남', '남성입니다', '여성입니다') AS 남녀확인
  FROM 직원 ;
  
  
  
--WHERE절 -부정연산
SELECT *
  FROM 직원
 WHERE NOT 이름 = '이현정' ;
 
SELECT * 
  FROM 직원
 WHERE 이름 != '이현정' ;
  
SELECT *
  FROM 직원
 WHERE 이름 <> '이현정' ;
 
--문제1 ) 직원연락처 테이블에서 구분코드가 ‘휴대폰‘ 이 아닌 데이터의 모든 정보를 출력해주세요
SELECT * 
  FROM 직원연락처
 WHERE 구분코드 != '휴대폰' ;
 
--문제2 ) 나이가 50살 미만이 아닌 직원의 직원ID , 이름 , 성별 , 나이 를 출력해주세
SELECT 직원ID
     , 이름
     , 성별
     , 나이
  FROM 직원 
 WHERE 나이 >= 50 ;

SELECT *
  FROM 직원
 WHERE 나이 = NULL ; --안나옴 NULL 은 산술연산 불가
 
SELECT *
  FROM 직원
 WHERE 나이 IS NULL ; --나옴
 
SELECT *
  FROM 직원
 WHERE 나이 IS NOT NULL ; --나옴
 
 
 --문제1 ) 직원 테이블에서 나이가 NULL 이 아닌 정보만 모두 출력해주세요
SELECT *
  FROM 직원
 WHERE 나이 IS NOT NULL ;
 
 
 
-- 문제2 ) 직원 중에 입사일시가 정해지지 않은 직원만 출력해주세요. 
SELECT *
  FROM 직원
 WHERE 입사일시 IS NULL ;
  
--IN 연산자(SQL연산자)
SELECT *
  FROM 직원
 WHERE 직원ID = 'A0001' OR 직원ID = 'A0003' OR 직원ID = 'A0005' OR 직원ID = 'A0007' ;
 
---아래와 위는 동일한 값을 추출함.
SELECT *
  FROM 직원
 WHERE 직원ID NOT IN ('A0001','A0003', 'A0005', 'A0007', NULL) ;
  
SELECT *
  FROM 직원
 WHERE 나이 >= 20
   AND 나이 <=29 ;

SELECT *
  FROM 직원
 WHERE 나이 BETWEEN 20 AND 29 ;
 
--주의사항 3가지
--모든 자료형 가능(날짜형, 숫자형, 문자형 다 쓸 수 있다.)
--OR가 아님, 무조건 AND이다
--이상 , 이하임
--첫번쨰 값이 두번째 값과 같거나 작아야한다.

SELECT *
  FROM 직원
 WHERE 입사일시 BETWEEN SYSDATE - 365 AND SYSDATE ; --가능

SELECT *
  FROM 직원
 WHERE 직원ID BETWEEN 'A0001' AND 'A0005' ; --가능
  
--LIKE 는 매칭 연산을 할수 있다.
--예시 1 ) 직원들 중 이름이 ‘강’ 으로 시작하는 모든 대상을 출력해주세요.
SELECT *
  FROM 직원
 WHERE 이름 LIKE '강%' ;
--%는 0개 이상의 문자를 매칭할 수 있다. '강' 도 출력함. 0개도 가능

--예시 2 ) 직원들 중 이름 중에 ‘홍’ 이 포함된 모든 대상을 출력해주세요.
SELECT *
  FROM 직원
 WHERE 이름 LIKE '%홍%' ;
 
--예시 3 ) 직원들 중 패스워드가 ‘123’ 으로 끝나는 모든 대상을 출력해주세요.
SELECT *
  FROM 직원
 WHERE 패스워드 LIKE '%123' ;
  
--예시 4 ) 직원들 중 이름의 세번째 글자가 ‘수’ 인 세글자인 모든 대상을 출력해주세요.
SELECT * 
  FROM 직원
 WHERE 이름 LIKE '__수' ;
 
--예시 5 ) 부서이름 중 @@부처럼 3글자로 이뤄지고 부로 끝나는 모든 대상을 출력해주세요
SELECT *
  FROM 부서
 WHERE 부서명 LIKE '__부' ;
 
 
--EX) 직원들 중 2015년에 입사한 대상을 출력해주세요.
--1.TO_CHAR을 활용한 방법 (초보자)
SELECT *
  FROM 직원
 WHERE TO_CHAR(입사일시, 'YYYY') = '2015' ;

--2.TO_DATE를 활용한 방법 (중급자)
SELECT *
  FROM 직원
 WHERE 입사일시 BETWEEN TO_DATE('20150101') AND TO_DATE('20160101') ;
 
SELECT *
  FROM 직원
 WHERE 입사일시 >= TO_DATE('20150101')
   AND 입사일시 < TO_DATE('20160101') ;
   
   
   
--문제1 ) 직원 테이블에서 이름에 ‘철‘ 이 포함되는 직원의 직원ID , 이름, 나이를 출력해주세요.
SELECT 직원ID
     , 이름
     , 나이
  FROM 직원
 WHERE 이름 LIKE '%철%';
 
--문제2 ) 직원 중에 2015년도에 입사를 했거나, 입사일시가 정해지지 않은 직원의 모든 정보를 출력해주세요
SELECT *
  FROM 직원
 WHERE 입사일시 BETWEEN TO_DATE('20150101000000', 'YYYY/MM/DD HH24:MI:SS') 
   AND TO_DATE('20151231235959' , 'YYYY/MM/DD HH24:MI:SS') 
    OR 입사일시 IS NULL ;


--문제3 ) 2017년 이후부터 현재 시점까지 입사한 모든 직원을 출력해주세요.
SELECT *
  FROM 직원
 WHERE 입사일시 >= TO_DATE('20170101000000', 'YYYYMMDDHH24MISS') ;

--문제4 ) 직원 중에 연봉이 7000 ~ 9000 사이인 직원들의 직원ID , 연봉 , 입사일시를 출력해주세요.
SELECT 직원ID
     , 연봉
     , 입사일시
  FROM 직원
 WHERE 연봉 BETWEEN 7000 AND 9000 ;
 
--문제5 ) 직원주소 테이블에서 주소가 ‘동구‘ 로 시작하는 모든 데이터를 출력해주세요
SELECT 직원ID
     , 구분코드
     , 주소
  FROM 직원주소
 WHERE 주소 LIKE '동구%' ;
 
 
 --FROM
SELECT SERVICE.직원.직원ID
  FROM SERVICE.직원
 WHERE SERVICE.직원.직원ID = 'A0005';
 
SELECT 직원ID
  FROM 직원
 WHERE 직원ID = 'A0005' ;
 
SELECT * 
  FROM 직원 , 직원연락처 ;
  
SELECT 직원.직원ID
     , 직원.이름
     , 직원.나이
     , 직원.연봉
     , 직원연락처.직원ID
     , 직원연락처.연락처
  FROM 직원, 직원연락처
 WHERE 직원.직원ID = 직원연락처.직원ID ;
 
SELECT A.직원ID
     , A.이름
     , A.나이
     , A.연봉
     , B.직원ID
     , B.연락처
  FROM 직원 A , 직원연락처 B
 WHERE A.직원ID = B.직원ID ;
 
 --FROM이 가장 먼저 실행
 
 
 --조인
 SELEcT * FROM 직원 ; 
 
SELECT  A.직원ID
      , A.이름
      , A.연봉
      , B.연락처
  FROM  직원 A
      , 직원연락처 B
 WHERE A.직원ID = B.직원ID
   AND A.직원ID = 'A0006'
   AND B.구분코드 = '휴대폰' ;
 
 