select * from ���� ;
select ����ID, �н�����,�̸�, ����, ���� --���ϴ� �÷��� �����´�,
FROM ���� --�����͸� ������ ���̺��� ���Ѵ�. 
WHERE ���� = '��'; --���ϴ� �ุ ���������� ������ �ش�.
--������ CTRL + ENTER

--�ּ�  ����
/*
 abcc
*/

-- ���� ' ' ���



select �̸�
     , ���� 
  from  ���� 
  where ����ID = 'A0001';
select * from ���� where ����ID = 'A0001' AND �н�����='12345';
select * from ���� where ����ID = 'A0001' OR ����ID = 'A0002';


/************************** �ǽ� *****************************/ 
SELECT  ����ID
     ,  �Ի��Ͻ� 
     ,  �ֹε�Ϲ�ȣ
     ,  ����
     ,  �μ�ID 
  FROM  ���� ;
  
SELECT �μ�ID
     , �μ���
     , �ٹ��� 
  FROM �μ� ;
  
SELECT ����ID
     , �����ڵ�
     , ����ó 
  FROM ��������ó ;
  
 
SELECT *
  FROM ���� ;

SELECT *
  FROM �����ּ� ;
  
SELECT * 
  FROM ��������ó ;
  
SELECT 
  DISTINCT ����ID 
  FROM ��������ó ;
  
/**************************�ǹ� TIP*****************************/
SELECT 
  DISTINCT ����
  FROM ���� ;

SELECT
  DISTINCT ����,�̸�
  FROM ���� ;
  
/************************** AS���� *****************************/
SELECT ����ID      AS EMP_ID 
     , �н�����     AS PASSWD
     , �̸�        AS NAME
  FROM ���� ;
  
SELECT ����ID      AS EMP_ID --���� �Ұ�
     , �н�����     AS PASSWD100 --����,Ư�����ڽ��ۺҰ�
     , �̸�        AS abc$ --Ư�����ڴ� $,_,#�� ����
     , ����        AS pep -- ����� �Ұ�
  FROM ����;  

/************************** NULL *****************************/
SELECT * 
  FROM ����
  WHERE ����ID = 'A0003' ;

INSERT INTO ���� ( 
����ID
, �н�����
, �̸�
, ����
, �Ի��Ͻ�
, �ֹε�Ϲ�ȣ
, ����
, �μ�ID
) VALUES (
'A0011' 
, 'newman'
, '����'
, '��' 
, SYSDATE 
, '940123-1332219' 
, 3000 
, 'D004' 
) ;

COMMIT ;

SELECT * FROM ����;

CREATE TABLE �׽�Ʈ���̺� ( --�׽�Ʈ���̺� �̶�� �̸��� ���̺��� ����ϴ�. 
������ VARCHAR2(10) , --������ �̶�� �÷��� �������ڷ���(VARCHAR2)�ο�
������ NUMBER , --������ �̶�� �÷��� �������ڷ���(NUMBER) �ο�
��¥�� DATE ) ; --��¥�� �̶�� �÷��� ��¥���ڷ���(DATE) �ο�

SELECT * 
  FROM �׽�Ʈ���̺� ;
  
INSERT INTO �׽�Ʈ���̺� ( ������ , ������ , ��¥�� ) VALUES ( 'A' , 1 , SYSDATE ); --�ɱ��? O
INSERT INTO �׽�Ʈ���̺� ( ������ , ������ , ��¥�� ) VALUES ( 'A' , '3' , SYSDATE ); --�ɱ��? O 
INSERT INTO �׽�Ʈ���̺� ( ������ , ������ , ��¥�� ) VALUES ( 'A' , 3 , 1 ); --�ɱ��? X
INSERT INTO �׽�Ʈ���̺� ( ������ , ������ , ��¥�� ) VALUES ( 'BB' , '3' , SYSDATE ); --�ɱ��? O
INSERT INTO �׽�Ʈ���̺� ( ������ , ������ , ��¥�� ) VALUES ( 'ABC' , 2 , '230314'); -- �����Ӱ� �Է��غ��ô� O
INSERT INTO �׽�Ʈ���̺� ( ������ , ������ , ��¥�� ) VALUES ( 'ABC' , 2 , '23/03/14'); -- �����Ӱ� �Է��غ��ô� O
INSERT INTO �׽�Ʈ���̺� ( ������ , ������ , ��¥�� ) VALUES ( 'ABC' , 2 , '2322222222'); -- �����Ӱ� �Է��غ��ô� X
INSERT INTO �׽�Ʈ���̺� ( ������ , ������ , ��¥�� ) VALUES ( 'ABC' , 2 , '23-03-14'); -- �����Ӱ� �Է��غ��ô� O

SELECT * 
  FROM ����
  WHERE �μ�ID = 'D001' ;

SELECT * 
  FROM ���� ;
  
SELECT *
  FROM ����
  WHERE �Ի��Ͻ� >= '21/09/11' ;
  
SELECT *
  FROM ����
  WHERE ����= '��' ;
  
SELECT *
  FROM ����
  WHERE ���� >= 8000 ;

/******************************* �ǽ� *****************************/

--1
SELECT ����ID
     , �̸�
     , ����
     , �Ի��Ͻ� 
  FROM ���� 
 WHERE ���� > 9000 ;
  
--2
SELECT * 
  FROM ���� 
 WHERE �̸� = '������' ;
  
--3
SELECT *
  FROM ��������ó
 WHERE ����ó = '010-1231-1234';
  
--4
SELECT �μ��� 
  FROM �μ� 
 WHERE �ٹ��� = '����' ;
  
--5
SELECT �ּ�
  FROM �����ּ�
 WHERE ����ID = 'A0007' ;
 
 /************************** �ڵ� *****************************/
 
 SELECT ����ID
      , ����
      , ����
      , �μ�ID
  FROM  ���� 
 WHERE  ���� = '��' 
   AND  ���� > 28
   ORDER BY ����
   ;
   
SELECT * 
  FROM ����
 WHERE �μ�ID = 'D002'
    OR �μ�ID = 'D004' ;
    
/*********************** �ǽ� *********************************************/

--1
SELECT ����ó 
  FROM ��������ó 
 WHERE ����ID = 'A0001' 
   AND �����ڵ� = '����ȭ' ;
 

 
--2
SELECT *
  FROM ���� 
 WHERE �μ�ID = 'D003'
   AND ���� = '��'
   AND ���� >= 30 ;
   
--3
SELECT *
  FROM ����
 WHERE ����ID = 'A0001'
    OR ����ID = 'A0005'
    OR ����ID = 'A0007' ;

--ex
SELECT *
  FROM ����
 WHERE ����ID = 'A0001' OR 'A0005' OR 'A0007' ; --error �̷��Դ� �Ұ�
  
  
SELECT *
  FROM ����
 WHERE �μ�ID = 'D001'
    OR �μ�ID = 'D002'
   AND �̸�   = '��ö��' ;