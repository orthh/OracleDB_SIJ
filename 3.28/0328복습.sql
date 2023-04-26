--DDL - 데이터 정의어
--=> CREATE, ALTER, DROP, TRUNCATE, RENAME 
--
--DROP : 복원불가

select * from QUIz_TABLE ;

DELETE FROM QUIZ_TABLE ;  --데이터 삭제, 느림, ROLLBAck 가능
ROLLBAcK ;

SELECT * FROM QUIZ_TABLE ;
TRUNCATE TABLE QUIZ_TABLE;  -- 데이터 삭제, 빠름, ROLLBAK 불가능
DROP TABLE QUIz_TABLE ; --데이터 뿐 아니라 테이블 자체 삭제, ROLLBACK 불가능

-- 시퀀스 : 자동으로 증가하는 값을 만들어주는 객체

--뷰 : 가상 테이블
--현업에서는 인라인 뷰를 더 자주씀
