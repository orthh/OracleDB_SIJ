--UPDATE 테이블명 SET 바꿀컬럼 = 바꿀값 WHERE 바꾸고싶은행조건 ;

--DELETE FROM 테이블명 WHERE 행조건;

SELECT * FROM 직원연락처 WHERE 직원ID = 'A0008' ;

--DDL(Data Definition Language)
--자료형 
--NUMBER(n,m) n자리만큼 입력 받고 m자리만큼 소수자리를 쓰겠다.
--실무에서는 그냥넘버로씀

CREATE TABLE QUIZ_TABLE (
   
   Q_ID        NUMBER(3,0) NOT NULL ,
   
   Q_CONTENT   VARCHAR2(200) NOT NULL,
   
   Q_ANSWER    VARCHAR2(100) , 
   
   REG_DATE    DATE DEFAULT SYSDATE
   
) ;

INSERT INTO QUIZ_TABLE (
       Q_ID
     , Q_CONTENT
     , Q_ANSWER
)VALUES (
       1
     , '쥐는 영어로 무엇일까요?'
     , 'mouse'
) ;

INSERT INTO QUIZ_TABLE (
       Q_ID
     , Q_CONTENT
     , Q_ANSWER
)VALUES (
       2
     , '달력은 영어로 무엇일까요?'
     , 'calendar'
) ;

INSERT INTO QUIZ_TABLE (
       Q_ID
     , Q_CONTENT
     , Q_ANSWER
)VALUES (
       3
     , '종이는 영어로 무엇일까요?'
     , 'paper'
) ;

--실습1
CREATE TABLE 회원정보 (

   회원ID      VARCHAR2(10) NOT NULL ,
   
   이름        VARCHAR2(20) NOT NULL ,
   
   가입일자     DATE ,
   
   나이        CHAR(3) DEFAULT 0
   
) ;

CREATE TABLE 회원연락처 (

   회원ID      VARCHAR2(10) NOT NULL ,
   
   구분코드     VARCHAR2(10) NOT NULL ,
   
   연락처      VARCHAR2(15) NOT NULL 
   
) ;

CREATE TABLE 회원주소 (
   
   회원ID       VARCHAR(10) NOT NULL ,
   
   도로명주소    VARCHAR(200) NOT NULL 
   
) ;

--실습2
ALTER TABLE 회원정보 ADD CONSTRAINT PK_회원정보 PRIMARY KEY (회원ID) ;
ALTER TABLE 회원연락처 ADD CONSTRAINT PK_회원연락처 PRIMARY KEY (회원ID, 구분코드) ;
ALTER TABLE 회원주소 ADD CONSTRAINT PK_회원주소 PRIMARY KEY (회원ID) ;

COMMIT ;

--실습3
ALTER TABLE 회원연락처 ADD CONSTRAINT FK_회원연락처 
      FOREIGN KEY (회원ID) REFERENCES 회원정보(회원ID) ;
      
ALTER TABLE 회원주소 ADD CONSTRAINT FK_회원주소
      FOREIGN KEY (회원ID) REFERENCES 회원정보(회원ID) ;
      
COMMIT ;

--ALTER 테이블을 잘못 만들어도 수정 가능
ALTER TABLE 직원 ADD ( 생년월일 VARCHAR2(8) ) ;

select * FROM 직원 ;
ALTER TABLE 직원 DROP COLUMN 생년월일 ;

ALTER TABLE 직원 MODIFY (패스워드 VARCHAR2(300) ) ;

ALTER TABLE 직원 RENAME COLUMN 패스워드 TO 비밀번호 ; 
