SELECT * FROM 고객 ;
SELECT * FROM 고객전화번호 ;

SELECT * FROM 고객,고객전화번호;

SELECT A.고객번호
     , A.고객명
     , B.전화번호
  FROM 고객 A, 고객전화번호 B ;
 
--2
SELECT A.고객번호
     , A.고객명
     , B.전화번호
  FROM 고객 A, 고객전화번호 B
 WHERE A.고객번호 = B.고객번호 ;
 
--3
SELECT A.고객번호
     , A.고객명
     , B.전화번호
  FROM 고객 A, 고객전화번호 B
 WHERE A.고객번호 = B.고객번호  --조인조건
   AND B.전화구분코드 = '집전화' --일반조건
   AND A.고객번호 = '0001' ;   --일반조건
   
SELECT A.고객번호 AS 고객_번호
     , B.고객번호 AS 고객전화번호_번호
  FROM 고객 A, 고객전화번호 B
 WHERE A.고객번호 = B.고객번호  --조인조건
   AND B.전화구분코드 = '집전화' --일반조건
   AND A.고객번호 = '0001' ;   --일반조건
   
   
--동등조인 / 비동등조인
--1. 실무에서 동등조인을 주로 쓴다.
--2. 조인조건이 하나라도 '=' 이게 아니면 비동등조인
SELECT *
  FROM 고객, 고객전화번호
 WHERE 고객.고객번호 = 고객전화번호.고객번호 ; --동등조인
 
SELECT *
  FROM 고객, 고객전화번호
 WHERE 고객.고객번호 <= 고객전화번호.고객번호 ; --비동등조인

SELECT *
  FROM 고객 A
     , 고객전화번호 B
 WHERE A.고객번호 = B.고객번호(+) ; --아우터 조인 -- 특정 테이블 기준으로 조인에 실패한 대상도 출력
 

SELECT *
  FROM 고객 A
     , 고객전화번호 B
 WHERE A.고객번호(+) = B.고객번호 ; -- +기호가 붙은 쪽의 반대쪽 테이블을 기준으로 한다.
 
 
--실습1.
SELECT A.직원ID AS 직원_직원ID
     , A.성별
     , A.나이
     , B.직원ID AS 주소_직원ID
     , B.구분코드
     , B.주소
  FROM 직원     A
     , 직원주소  B
 WHERE A.직원ID = B.직원ID
   AND 구분코드 = '집' ;
   
--실습2
SELECT A.직원ID AS 직원_직원ID
     , A.성별
     , A.나이
     , B.직원ID AS 주소_직원ID
     , B.구분코드
     , B.주소
  FROM 직원    A
     ,직원주소  B
 WHERE A.직원ID = B.직원ID
   AND B.구분코드 = '집'
   AND A.직원ID = 'A0007' ;
   
--실습3
SELECT A.직원ID AS 직원_직원ID
     , A.이름
     , A.연봉
     , B.직원ID AS 주소_직원ID
     , B.구분코드
     , B.주소
  FROM 직원     A
     , 직원주소  B
 WHERE A.직원ID = B.직원ID(+) ;
  
--실습4
SELECT A.직원ID AS 직원_직원ID
     , A.이름
     , A.연봉
     , B.직원ID AS 주소_직원ID
     , B.구분코드
     , B.주소
  FROM 직원      A
     , 직원주소   B
 WHERE A.직원ID = B.직원ID(+) 
   AND B.주소 IS NULL ;
  
--실습5
SELECT A.직원ID
     , A.이름
     , A.나이
     , C.연락처
     , B.주소
  FROM 직원 A
     , 직원주소 B
     , 직원연락처 C
 WHERE A.직원ID = B.직원ID 
   AND A.직원ID = C.직원ID ;
 

--실습6
SELECT A.직원ID
     , A.이름
     , A.입사일시
     , B.연락처
  FROM 직원 A 
     , 직원연락처 B
 WHERE A.직원ID = B.직원ID
   AND B.구분코드 = '휴대폰'
   AND A.직원ID IN ('A0001', 'A0002', 'A0003') ;
   
--실습7
SELECT A.직원ID
     , A.이름
     , A.부서ID
     , B.부서명
  FROM 직원 A
     , 부서 B
 WHERE A.부서ID = B.부서ID ;

SELECT *
  FROM 고객 A, 고객전화번호 B
 WHERE A.고객번호 = B.고객번호(+) ;
 
SELECT *
  FROM 고객 A LEFT OUTER JOIN 고객전화번호 B
    ON (A.고객번호 = B.고객번호) ;
    
    
--INNER조인 ORACLE -> ANSI규격
--ORACLE ONLY
SELECT A.직원ID
     , A.이름
     , B.주소
  FROM 직원 A
     , 직원주소 B
 WHERE A.직원ID = B.직원ID
   AND A.직원ID = 'A0006' ;

--ANSI규격 ORACLE,MYSQL 등 SQL구문 다 가능
SELECT A.직원ID
     , A.이름
     , B.주소
  FROM 직원 A INNER JOIN 직원주소 B
    ON (A.직원ID = B.직원ID)
 WHERE A.직원ID = 'A0006' ;
 
--FULL OUTER JOIN (오라클x)
SELECT *
  FROM 고객 A FULL OUTER JOIN 고객전화번호 B
    ON (A.고객번호 = B.고객번호) ;
    
--실습1
SELECT A.직원ID
     , A.이름
     , B.주소
  FROM 직원 A LEFT OUTER JOIN 직원주소 B
    ON (A.직원ID = B.직원ID)
 WHERE A.직원ID IN ('A0005','A0008') ;
 
--실습2
SELECT B.직원ID
     , B.이름
     , A.주소
  FROM 직원주소 A RIGHT OUTER JOIN 직원 B
    ON (A.직원ID = B.직원ID) ;
     
--실습3
SELECT A.직원ID
     , A.이름
     , A.나이
     , B.연락처
  FROM 직원 A INNER JOIN 직원연락처 B
    ON (A.직원ID = B.직원ID);
    
    
--테이블 3개 조인하는법
SELECT A.직원ID
     , A.이름
     , B.연락처
     , C.주소
  FROM 직원 A
     , 직원연락처 B
     , 직원주소 C
  WHERE A.직원ID = B.직원ID
    AND B.직원ID = C.직원ID ;
  
--ANSI
SELECT A.직원ID
     , A.이름
     , B.연락처
     , C.주소
  FROM 직원 A INNER JOIN 직원연락처 B
    ON (A.직원ID = B.직원ID) INNER JOIN 직원주소 C ON (B.직원ID = C.직원ID) ;
-- 하나를 조인하고 그 후 나머지 하나를 순차적으로 조인한다.


--GROUP BY
DROP TABLE 학생인적사항 ;
DROP TABLE 수강생정보 ; 
DROP TABLE 성적표 ; 
CREATE TABLE 수강생정보 (
학생ID VARCHAR2(9) PRIMARY KEY , 
학생이름 VARCHAR2(50) NOT NULL , 
소속반 VARCHAR2(5) 
); 
CREATE TABLE 성적표 ( 
학생ID VARCHAR2(9) , 
과목 VARCHAR2(30) , 
성적 NUMBER , 
CONSTRAINT PK_성적표 PRIMARY KEY(학생ID , 과목) , 
CONSTRAINT FK_성적표 FOREIGN KEY(학생ID) REFERENCES 수강생정보(학생ID) 
) ; 
INSERT INTO 수강생정보 VALUES ('S0001' , '김현철' , 'A') ; 
INSERT INTO 수강생정보 VALUES ('S0002' , '문현중' , 'A') ; 
INSERT INTO 수강생정보 VALUES ('S0003' , '강문치' , 'B') ; 
INSERT INTO 수강생정보 VALUES ('S0004' , '박나선' , 'B') ; 
INSERT INTO 수강생정보 VALUES ('S0005' , '신태강' , 'B') ; 
INSERT INTO 수강생정보 VALUES ('S0006' , '물고기' , 'C') ; 
INSERT INTO 수강생정보 VALUES ('S0007' , '자라니' , 'C') ; 
INSERT INTO 수강생정보 VALUES ('S0008' , '공팔두' , 'C') ; 
INSERT INTO 수강생정보 VALUES ('S0009' , '최팔현' , 'C') ; 
INSERT INTO 성적표 VALUES('S0001' ,'국어' , 90); 
INSERT INTO 성적표 VALUES('S0001' ,'수학' , 85); 
INSERT INTO 성적표 VALUES('S0001' ,'영어' , 100); 
INSERT INTO 성적표 VALUES('S0002' ,'국어' , 100); 
INSERT INTO 성적표 VALUES('S0002' ,'수학' , 100); 
INSERT INTO 성적표 VALUES('S0002' ,'영어' , 20); 
INSERT INTO 성적표 VALUES('S0003' ,'국어' , 100); 
INSERT INTO 성적표 VALUES('S0003' ,'수학' , 100); 
INSERT INTO 성적표 VALUES('S0003' ,'영어' , 20); 
INSERT INTO 성적표 VALUES('S0004' ,'국어' , 85); 
INSERT INTO 성적표 VALUES('S0004' ,'수학' , 40); 
INSERT INTO 성적표 VALUES('S0004' ,'영어' , 60); 
INSERT INTO 성적표 VALUES('S0005' ,'국어' , 100); 
INSERT INTO 성적표 VALUES('S0005' ,'수학' , 100); 
INSERT INTO 성적표 VALUES('S0005' ,'영어' , 100); 
INSERT INTO 성적표 VALUES ( 'S0006' , '국어' , NULL ) ; 
INSERT INTO 성적표 VALUES ( 'S0006' , '수학' , NULL ) ; 
INSERT INTO 성적표 VALUES ( 'S0006' , '영어' , NULL ) ; 
COMMIT;


SELECT * FROM 성적표 ;


--GROUP BY
SELECT 소속반
     , COUNT(*) AS 반별인원수
  FROM 수강생정보
 GROUP BY 소속반 ;

--GROUP BY는 실제로 출력되는 튜플이 감소,
-- 따라서 입력할 수 있는 컬럼이 제한됨.
SELECT 소속반
     , 학생이름
  FROM 수강생정보
 GROUP BY 소속반 ;
 
SELECT 소속반, COUNT(*)
  FROM 수강생정보
 GROUP BY 소속반 ;

 
SELECT 학생ID
     , AVG(성적)
  FROM 성적표
 GROUP BY 학생ID ;
 
SELECT 학생ID
     , SUM(성적)
  FROM 성적표
 GROUP BY 학생ID ;

SELECT * FROM 수강생정보 ;
SELECT * FROM 성적표 ;

SELECT 학생ID
     , MAX(성적)
     , MIN(성적)
  FROM 성적표
 GROUP BY 학생ID ;