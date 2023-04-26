select * FROM QUIZ_TABLE ;

--�ڸ�Ʈ �Է¹�
COMMENT ON TABLE QUIZ_TABLE IS '���������� �� ���̺�' ;
COMMENT ON COLUMN QUIZ_TABLE.Q_ID IS '����ID' ;

CREATE TABLE bbb(
col1 VaRCHAR2(100) 
) ;

select * FROM bbb; 

--DROP
--DROP TABLE ���̺�� [CASCADE CONSTRAINT]
DROP TABLE ȸ������ ;  -- �ܷ�Ű�� ���� �����Ȱ�� ����

--CASCADE CONSTRAINT : (CASCADE : ���������� ) 
DROP TABLE ȸ������ CASCADE CONSTRAINT ; --�����Ȱ�� ���� ��� ���� ����

SELECT * FROM ȸ������ ;

--TRUNCATE �� ���̺��� �����͸� �����Ѵ�.

--1. DELETE (ROLLBACK�� ����) : �ǵ��� �� �ִ� , �α׸� ����鼭 ���� . �ӵ� ����
DELETE FROM ����ǥ ; --������ ����  , COMMIT �� ��������

--2. TRUNCATE ( ROLLBACK�� �Ұ��� ) : �������� , �α�x, �ӵ����� , �����Ұ�
TRUNCATE FROM ����ǥ ;  -- where ���Ұ�, ��絥���� ������� , table�� ����

--3. DROP (ROLLBACK �Ұ���) : ��������
DROP TABLE ����ǥ ; --���̺� ����

--RENAME : ���̺� �̸� �ٲٱ�

--������ : "��������"�� �ǹ� , �ڵ����� �����ϴ� ���� ������ִ� ��ü
CREATE SEQUENCE ����ID_SEQ 
       INCREMENT BY 1  -- ������ ��������
       START WITH 1    -- 
       MINVALUE 1
       MAXVALUE 9999 ;
       
select ����ID_SEQ.NEXTVAL FROM DUAL ; --NEXTVAL : ������

INSERT INTO ���� (
����ID
, ��й�ȣ
, �̸�
, ����
, ����
, �Ի��Ͻ�
, �ֹε�Ϲ�ȣ
, ����
, �μ�ID
) VALUES ( 
'A' || LPAD( ����ID_SEQ.NEXTVAL , 4 , '0' )  -- LPAD : LEFTPAD  LPAD(������,�ڸ���,LEFT������� ä�ﰪ)
, '��й�ȣ123' 
, '������'
, '��'
, 30
, SYSDATE 
, '930711-2441223' 
, 5000 
, 'D006' 
);
select * FROM ���� ;
SELECT 'A' || LPAD( ����ID_SEQ.NEXTVAL , 4 , '0' ) FROM DUAL;

DROP SEQUENCE ����ID_SEQ ;

--��(VIEW) : �� ���� ���� ���ϱ� ���� ������ �ϰ�ʹ�. 
--AS ���� �� ���� ����
CREATE VIEW �μ����ְ���_VIEW AS 
SELECT �μ�ID
     , MAX(����) AS �μ����ְ���
  FROM ����
 GROUP BY �μ�ID
 ORDER BY �μ�ID ;
 
DELETE FROM ���� WHERE �̸� = '������' ;
COMMIT ; 

--�� ����
SELECT * FROM �μ����ְ���_VIEW ;

--���ǻ���
--Q. ��� ��������/���� �����͸� ������ �ִ� . (Ʋ��) : �׳� �츮�� ���鶧 ����� ����(SQL)
--   �� ���ۼ�(REWRITE)�� ���̴�.

--��� ���̺��� ��밡���ϴ�.
SELECT A.�̸�
     , A.����
     , B.�μ����ְ���
  FROM ���� A
     , �μ����ְ���_VIEW B
 WHERE A.�μ�ID = B.�μ�ID
   AND A.���� = B.�μ����ְ��� ; 
   
--�ζ��� �� : �������� ��� �� �ϳ��� FROM���� ������ �ۼ��� ������ ���̺� ó�� ����ϴ� ���.
--���� �Ʒ��� �����ڵ�
SELECT A.�̸�
     , A.����
     , B.�μ����ְ���
  FROM ���� A
     , (  
       SELECT �μ�ID, MAX(����) AS �μ����ְ���
         FROM ����
        GROUP BY �μ�ID
        ORDER BY �μ�ID
        ) B
 WHERE A.�μ�ID = B.�μ�ID
   AND A.���� = B.�μ����ְ��� ; 
--�並 ����ٴ°� ���� ���� ������ �����س��� ���� ���ٴ°�, 4�������� �׳� �ζ��κ�� �־������.
--���ϴ� �����͸� ������ �� �ְ� �� ���� �������� ��� �� �� �ִ�.
CREATE VIEW ����_�ΰ��������� AS
SELECT ����ID
     , �̸�
     , �μ�ID
  FROM ���� ;
   
SELEcT * FROM ����_�ΰ��������� ;

DROP VIEW �μ����ְ���_VIEW ;

--TCL
--Ʈ����� ����
--Ʈ����� : ������ ó���ϱ� ���� �Ϸ��� ����
--Ʈ����� ���߿� �ϳ��� ������ ����� ������ �ߴ� ��� Ȱ���� ROLLBACK�ȴ�.
--Ʈ����� Ư¡ : ���ڼ�(Atomicity), �ϰ���(Consistency)
             --, ����(isolation), ���Ӽ�/���Ӽ�(Duability)
--���ڼ� : Ʈ������� ��� �Ϸ�ǰų� �ϳ��� ���н� ��� ���󺹱� �Ǿ���Ѵ�.(ALL OR NOTHING)
--�ϰ��� : �׻� �ϰ����� ���¸� �������Ѵ�. Ʈ����� �������� �����̶�� ���� �ĵ� �����̾���Ѵ�.
--���� : Ʈ������� ���� �����ϸ� �ȵȴ�.
--���Ӽ� : ���� ������ ������ �ݵ�� �ݿ��Ǿ�� �Ѵ�.


UPDATE ����
   SET ���� = ���� + 1000
 WHERE ����ID = 'A0005';
 
 commit ; --�ݵ�� commit �ؾ� �����Ͱ� �����ݿ��ȴ�.
 
 select ����ID,�̸�,���� from ���� where ����id = 'A0005';
 
--SAVEPOINT

--LOCK
UPDATE ����
   SET ���� = 9999
 WHERE ����ID = 'A0003' ;
 
 ROLLBACK ;
 
--����Ŭ
 DML(������ ���۾�) : INSERT, UPDATE, DELETE            => ���� COMMIT �� ����� �����ݿ��� �ȴ�.
 DDL(������ ���Ǿ�) : CREATE, ALTER, DROP, TRUNCATE     => �����Ҷ����� �ڵ����� �˾Ƽ� COMMIT �� �ȴ�.
 
 INSERT ...
 CREATE ...   ����INSERT �� �˾Ƽ� COMMIT �� �ȴ�.
 
 
 -----
 INSERT INTO ...
 COMMIT ;
 
 INSERT INTO ...
 DELETE ...
 UPDATE ...
 
 ROLLBACK ; --������ COMMIT �������� ���ư�.
  
 
 
--DCL
select * FROM ���� ;
 
 