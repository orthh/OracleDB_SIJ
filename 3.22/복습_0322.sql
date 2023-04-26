SELECT A.고객번호
     , A.고객명
     , B.전화번호
  FROM 고객 A
     , 고객전화번호 B
 WHERE A.고객번호 = B.고객번호
   AND A.고객번호 = '0001'
   AND B.전화구분코드 = '집전화' ;
   
SELECT A.직원ID AS 직원_직원ID
     , A.성별
     , A.나이
     , B.직원ID AS 주소_직원ID
     , B.구분코드
     , B.주소
  FROM 직원 A
     , 직원주소 B
 WHERE A.직원ID = B.직원ID 
   AND A.직원ID = 'A0007' ;
   
--3
   
SELECT A.직원ID AS 직원_직원ID
     , A.이름
     , A.연봉
     , B.직원ID AS 주소_직원ID
     , B.구분코드
     , B.주소
  FROM 직원 A
     , 직원주소 B
 WHERE A.직원ID = B.직원ID(+) 
   AND B.주소 IS NULL ;
   
--5
SELECT A.직원ID
     , A.이름
     , A.나이
     , B.연락처
     , C.주소
  FROM 직원 A
     , 직원연락처 B
     , 직원주소 C
 WHERE A.직원ID = B.직원ID
   AND A.직원ID = C.직원ID ;
   
--6
SELECT A.직원ID
     , A.이름
     , A.입사일시
     , B.연락처
  FROM 직원 A
     , 직원연락처 B
 WHERE A.직원ID = B.직원ID
   AND A.직원ID IN ('A0001','A0002','A0003')
   AND B.구분코드 = '휴대폰' ;
   
--7
SELECT A.직원ID
     , A.이름
     , A.부서ID
     , B.부서명
  FROM 직원 A
     , 부서 B
 WHERE A.부서ID = B.부서ID ;
 
--1.
SELECT A.직원ID
     , A.이름
     , B.주소
  FROM 직원 A LEFT OUTER JOIN 직원주소 B
    ON (A.직원ID = B.직원ID)
 WHERE A.직원ID IN ('A0005','A0008') ;
 
--2.
SELECT B.직원ID
     , B.이름
     , A.주소
  FROM 직원주소 A RIGHT OUTER JOIN 직원 B
    ON A.직원ID = B.직원ID ;
    
--3
SELECT