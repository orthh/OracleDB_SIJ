SELECT * FROM �� ;
SELECT * FROM ����ȭ��ȣ ;

SELECT * FROM ��,����ȭ��ȣ;

SELECT A.����ȣ
     , A.����
     , B.��ȭ��ȣ
  FROM �� A, ����ȭ��ȣ B ;
 
--2
SELECT A.����ȣ
     , A.����
     , B.��ȭ��ȣ
  FROM �� A, ����ȭ��ȣ B
 WHERE A.����ȣ = B.����ȣ ;
 
--3
SELECT A.����ȣ
     , A.����
     , B.��ȭ��ȣ
  FROM �� A, ����ȭ��ȣ B
 WHERE A.����ȣ = B.����ȣ  --��������
   AND B.��ȭ�����ڵ� = '����ȭ' --�Ϲ�����
   AND A.����ȣ = '0001' ;   --�Ϲ�����
   
SELECT A.����ȣ AS ��_��ȣ
     , B.����ȣ AS ����ȭ��ȣ_��ȣ
  FROM �� A, ����ȭ��ȣ B
 WHERE A.����ȣ = B.����ȣ  --��������
   AND B.��ȭ�����ڵ� = '����ȭ' --�Ϲ�����
   AND A.����ȣ = '0001' ;   --�Ϲ�����
   
   
--�������� / �񵿵�����
--1. �ǹ����� ���������� �ַ� ����.
--2. ���������� �ϳ��� '=' �̰� �ƴϸ� �񵿵�����
SELECT *
  FROM ��, ����ȭ��ȣ
 WHERE ��.����ȣ = ����ȭ��ȣ.����ȣ ; --��������
 
SELECT *
  FROM ��, ����ȭ��ȣ
 WHERE ��.����ȣ <= ����ȭ��ȣ.����ȣ ; --�񵿵�����

SELECT *
  FROM �� A
     , ����ȭ��ȣ B
 WHERE A.����ȣ = B.����ȣ(+) ; --�ƿ��� ���� -- Ư�� ���̺� �������� ���ο� ������ ��� ���
 

SELECT *
  FROM �� A
     , ����ȭ��ȣ B
 WHERE A.����ȣ(+) = B.����ȣ ; -- +��ȣ�� ���� ���� �ݴ��� ���̺��� �������� �Ѵ�.
 
 
--�ǽ�1.
SELECT A.����ID AS ����_����ID
     , A.����
     , A.����
     , B.����ID AS �ּ�_����ID
     , B.�����ڵ�
     , B.�ּ�
  FROM ����     A
     , �����ּ�  B
 WHERE A.����ID = B.����ID
   AND �����ڵ� = '��' ;
   
--�ǽ�2
SELECT A.����ID AS ����_����ID
     , A.����
     , A.����
     , B.����ID AS �ּ�_����ID
     , B.�����ڵ�
     , B.�ּ�
  FROM ����    A
     ,�����ּ�  B
 WHERE A.����ID = B.����ID
   AND B.�����ڵ� = '��'
   AND A.����ID = 'A0007' ;
   
--�ǽ�3
SELECT A.����ID AS ����_����ID
     , A.�̸�
     , A.����
     , B.����ID AS �ּ�_����ID
     , B.�����ڵ�
     , B.�ּ�
  FROM ����     A
     , �����ּ�  B
 WHERE A.����ID = B.����ID(+) ;
  
--�ǽ�4
SELECT A.����ID AS ����_����ID
     , A.�̸�
     , A.����
     , B.����ID AS �ּ�_����ID
     , B.�����ڵ�
     , B.�ּ�
  FROM ����      A
     , �����ּ�   B
 WHERE A.����ID = B.����ID(+) 
   AND B.�ּ� IS NULL ;
  
--�ǽ�5
SELECT A.����ID
     , A.�̸�
     , A.����
     , C.����ó
     , B.�ּ�
  FROM ���� A
     , �����ּ� B
     , ��������ó C
 WHERE A.����ID = B.����ID 
   AND A.����ID = C.����ID ;
 

--�ǽ�6
SELECT A.����ID
     , A.�̸�
     , A.�Ի��Ͻ�
     , B.����ó
  FROM ���� A 
     , ��������ó B
 WHERE A.����ID = B.����ID
   AND B.�����ڵ� = '�޴���'
   AND A.����ID IN ('A0001', 'A0002', 'A0003') ;
   
--�ǽ�7
SELECT A.����ID
     , A.�̸�
     , A.�μ�ID
     , B.�μ���
  FROM ���� A
     , �μ� B
 WHERE A.�μ�ID = B.�μ�ID ;

SELECT *
  FROM �� A, ����ȭ��ȣ B
 WHERE A.����ȣ = B.����ȣ(+) ;
 
SELECT *
  FROM �� A LEFT OUTER JOIN ����ȭ��ȣ B
    ON (A.����ȣ = B.����ȣ) ;
    
    
--INNER���� ORACLE -> ANSI�԰�
--ORACLE ONLY
SELECT A.����ID
     , A.�̸�
     , B.�ּ�
  FROM ���� A
     , �����ּ� B
 WHERE A.����ID = B.����ID
   AND A.����ID = 'A0006' ;

--ANSI�԰� ORACLE,MYSQL �� SQL���� �� ����
SELECT A.����ID
     , A.�̸�
     , B.�ּ�
  FROM ���� A INNER JOIN �����ּ� B
    ON (A.����ID = B.����ID)
 WHERE A.����ID = 'A0006' ;
 
--FULL OUTER JOIN (����Ŭx)
SELECT *
  FROM �� A FULL OUTER JOIN ����ȭ��ȣ B
    ON (A.����ȣ = B.����ȣ) ;
    
--�ǽ�1
SELECT A.����ID
     , A.�̸�
     , B.�ּ�
  FROM ���� A LEFT OUTER JOIN �����ּ� B
    ON (A.����ID = B.����ID)
 WHERE A.����ID IN ('A0005','A0008') ;
 
--�ǽ�2
SELECT B.����ID
     , B.�̸�
     , A.�ּ�
  FROM �����ּ� A RIGHT OUTER JOIN ���� B
    ON (A.����ID = B.����ID) ;
     
--�ǽ�3
SELECT A.����ID
     , A.�̸�
     , A.����
     , B.����ó
  FROM ���� A INNER JOIN ��������ó B
    ON (A.����ID = B.����ID);
    
    
--���̺� 3�� �����ϴ¹�
SELECT A.����ID
     , A.�̸�
     , B.����ó
     , C.�ּ�
  FROM ���� A
     , ��������ó B
     , �����ּ� C
  WHERE A.����ID = B.����ID
    AND B.����ID = C.����ID ;
  
--ANSI
SELECT A.����ID
     , A.�̸�
     , B.����ó
     , C.�ּ�
  FROM ���� A INNER JOIN ��������ó B
    ON (A.����ID = B.����ID) INNER JOIN �����ּ� C ON (B.����ID = C.����ID) ;
-- �ϳ��� �����ϰ� �� �� ������ �ϳ��� ���������� �����Ѵ�.


--GROUP BY
DROP TABLE �л��������� ;
DROP TABLE ���������� ; 
DROP TABLE ����ǥ ; 
CREATE TABLE ���������� (
�л�ID VARCHAR2(9) PRIMARY KEY , 
�л��̸� VARCHAR2(50) NOT NULL , 
�Ҽӹ� VARCHAR2(5) 
); 
CREATE TABLE ����ǥ ( 
�л�ID VARCHAR2(9) , 
���� VARCHAR2(30) , 
���� NUMBER , 
CONSTRAINT PK_����ǥ PRIMARY KEY(�л�ID , ����) , 
CONSTRAINT FK_����ǥ FOREIGN KEY(�л�ID) REFERENCES ����������(�л�ID) 
) ; 
INSERT INTO ���������� VALUES ('S0001' , '����ö' , 'A') ; 
INSERT INTO ���������� VALUES ('S0002' , '������' , 'A') ; 
INSERT INTO ���������� VALUES ('S0003' , '����ġ' , 'B') ; 
INSERT INTO ���������� VALUES ('S0004' , '�ڳ���' , 'B') ; 
INSERT INTO ���������� VALUES ('S0005' , '���°�' , 'B') ; 
INSERT INTO ���������� VALUES ('S0006' , '�����' , 'C') ; 
INSERT INTO ���������� VALUES ('S0007' , '�ڶ��' , 'C') ; 
INSERT INTO ���������� VALUES ('S0008' , '���ȵ�' , 'C') ; 
INSERT INTO ���������� VALUES ('S0009' , '������' , 'C') ; 
INSERT INTO ����ǥ VALUES('S0001' ,'����' , 90); 
INSERT INTO ����ǥ VALUES('S0001' ,'����' , 85); 
INSERT INTO ����ǥ VALUES('S0001' ,'����' , 100); 
INSERT INTO ����ǥ VALUES('S0002' ,'����' , 100); 
INSERT INTO ����ǥ VALUES('S0002' ,'����' , 100); 
INSERT INTO ����ǥ VALUES('S0002' ,'����' , 20); 
INSERT INTO ����ǥ VALUES('S0003' ,'����' , 100); 
INSERT INTO ����ǥ VALUES('S0003' ,'����' , 100); 
INSERT INTO ����ǥ VALUES('S0003' ,'����' , 20); 
INSERT INTO ����ǥ VALUES('S0004' ,'����' , 85); 
INSERT INTO ����ǥ VALUES('S0004' ,'����' , 40); 
INSERT INTO ����ǥ VALUES('S0004' ,'����' , 60); 
INSERT INTO ����ǥ VALUES('S0005' ,'����' , 100); 
INSERT INTO ����ǥ VALUES('S0005' ,'����' , 100); 
INSERT INTO ����ǥ VALUES('S0005' ,'����' , 100); 
INSERT INTO ����ǥ VALUES ( 'S0006' , '����' , NULL ) ; 
INSERT INTO ����ǥ VALUES ( 'S0006' , '����' , NULL ) ; 
INSERT INTO ����ǥ VALUES ( 'S0006' , '����' , NULL ) ; 
COMMIT;


SELECT * FROM ����ǥ ;


--GROUP BY
SELECT �Ҽӹ�
     , COUNT(*) AS �ݺ��ο���
  FROM ����������
 GROUP BY �Ҽӹ� ;

--GROUP BY�� ������ ��µǴ� Ʃ���� ����,
-- ���� �Է��� �� �ִ� �÷��� ���ѵ�.
SELECT �Ҽӹ�
     , �л��̸�
  FROM ����������
 GROUP BY �Ҽӹ� ;
 
SELECT �Ҽӹ�, COUNT(*)
  FROM ����������
 GROUP BY �Ҽӹ� ;

 
SELECT �л�ID
     , AVG(����)
  FROM ����ǥ
 GROUP BY �л�ID ;
 
SELECT �л�ID
     , SUM(����)
  FROM ����ǥ
 GROUP BY �л�ID ;

SELECT * FROM ���������� ;
SELECT * FROM ����ǥ ;

SELECT �л�ID
     , MAX(����)
     , MIN(����)
  FROM ����ǥ
 GROUP BY �л�ID ;