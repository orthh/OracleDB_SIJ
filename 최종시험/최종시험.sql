----------------------------------����------------------------------------------
--����1.
--������ �������ϰ� 
--1. ������ �߻��� ����
--2. �� ��ġ����(�ùٸ� SQL����) �ۼ�

--1.���� : SERVICE ������ �ùٸ��� �����Ͽ�����, ������ ����� ����
--         ���� ������ ���� ���� ����̴�.

--2. ��ġ����
  --SQL COMMAND LINE ���� ������ ����(SYSTEM)���� �����Ͽ� SERVICE �� CREATE SESSION ������ �ִ� ��ɾ �����Ѵ�.
  --sql���� :  GRANT CREATE SESSION TO SERVICE ;






--����2.
--����, �����߻�
--1. �߻��� ����
    --FROM���� ��Ī�� �־ ��Ī�� ����ؾ��ϴµ�, WHERE������ ��Ī�� �ƴ� ���̺�� ��ü�� ����Ͽ���.

--2. �ذ��� �� �ִ� ��ġ����
    -- WHERE������ ���̺�� ��ü�� ����� ���� �� ���̺��� ��Ī���� ������ B�� ����Ѵ�.
SELECT A.CUST_NO 
     , A.CUST_NAME 
     , B.TEL_DVCD 
     , B.TEL_NO 
  FROM CUST_INFO A 
     , CUST_TEL_INFO B 
 WHERE A.CUST_NO = B.CUST_NO ;








--����Ǫ����
--����
SELECT �μ�ID 
     , SUM(����) AS �հ� 
     , AVG(����) AS ��� 
     , COUNT(*) AS ������
 FROM ����
WHERE ���� > 6000 
GROUP BY �μ�ID
ORDER BY �μ�ID ;

--����Ǯ��
SELECT �μ�ID 
     , SUM(����) AS �հ� 
     , AVG(����) AS ��� 
     , COUNT(*) AS ������
 FROM ����
GROUP BY �μ�ID
HAVING AVG(����) > 6000
ORDER BY �μ�ID ;



--����3.
--�μ��� ��տ��� 6000 �ʰ� �μ�
--1.����
    --1.�μ��� ��� ������ 6000������ �ʰ��ϴ� �μ��� ��ȸ�ϴ� �����ε�, WHERE������
        --��� ������ �ƴ� ���� �÷��� 6000 �ʰ��ϰ� �Ͽ���.
    --2.����� AVG�����Լ��� HAVING���� ������ �ټ� ������,
      --WHERE���� GROUP BY���� ���� ����Ǳ� ������ ���� �����Լ��� ����Ҽ� ����.
--2.��ġ����
    --HAVING�� ����Ͽ� AVG�Լ��� �̿��Ͽ� ��տ����� ���� �� ����Ѵ�.
    --sql������ �ùٸ��� �����Ѵ�
    -- sql : 
SELECT �μ�ID 
     , SUM(����) AS �հ� 
     , AVG(����) AS ��� 
     , COUNT(*) AS ������
  FROM ����
 WHERE ���� IS NOT NULL
 GROUP BY �μ�ID
 HAVING AVG(����) > 6000
 ORDER BY �μ�ID ;


--����4

SELECT ROWNUM, �̸� , ���� 
FROM ����
WHERE ROWNUM <=3
ORDER BY ���� DESC;
--���� : WHERE���� ORDER BY ���� ���� ����Ǳ� ������, ORDER BY ���� DESC �� ����Ǳ� ����
       -- WHERE������ ROWNUM �� �̰�, �� �Ŀ� ORDER BY �� �۵��Ͽ� 3���� ���� ���Ѵ�.
       
--��ġ����
  -- ���� ó���� �Ϸ�Ǿ� �ִ� ������ ���̺��� �ʿ��ϴ�.
SELECT * 
  FROM (
          SELECT ROWNUM
             , �̸� 
             , ���� 
          FROM ����
         WHERE ���� IS NOT NULL
         ORDER BY ���� DESC
        )
 WHERE ROWNUM <= 3 ;



--����5
FROM -> WHERE  -> GROUP BY -> HAVING -> SELECT -> ORDER BY



--6
SELECT A.����ID 
     , A.�̸� 
     , B.�μ��� 
 FROM ���� A LEFT OUTER JOIN �μ� B
   ON (A.�μ�ID = B.�μ�ID ) ;

--7
--7-1
CREATE TABLE PEOPLE (
    NAME VARCHAR2(20) NOT NULL ,
    AGE  NUMBER(5)
) ;

--7-2
ALTER TABLE PEOPLE ADD CONSTRAINT PK_NAME_PEOPLE PRIMARY KEY(NAME) ;


--7-3
INSERT INTO PEOPLE (
       NAME
     , AGE
) VALUES (
       '�����'
     , 40
) ;
INSERT INTO PEOPLE (
       NAME
     , AGE
) VALUES (
       '������'
     , 25
) ;
INSERT INTO PEOPLE (
       NAME
) VALUES (
       '������'
) ;
INSERT INTO PEOPLE (
       NAME
     , AGE
) VALUES (
       '����'
     , 40
) ;

--7-4
SELECT NAME
     , AGE
  FROM PEOPLE
 WHERE AGE IS NULL
    OR AGE = 40;
    
    
--����8
--SQL COMMAND LINE���� �⺻������ �����ڰ���(SYSTEM)�� �����Ѵ�.
-- conn SYSTEM/��й�ȣ 
--8.1
 CREATE USER OTHERSERVICE IDENTIFIED BY 12345;

--8.2
  --1.CREATE SESSION ������ �ش�.
  GRANT CREATE SESSION TO OTHERSERVICE ;
  
  --2. SERVICE������ ���� ���̺��� SELECT�Ҽ� �ִ� ������ �ش�.
  GRANT SELECT ON SERVICE.���� TO OTHERSERVICE ;
  
--8.3
  REVOKE SELECT ON SERVICE.���� FROM OTHERSERVICE ;
  
--8.4
  GRANT RESOURCE , CONNECT TO OTHERSERVICE ;
  
  
  --test
  INSERT INTO PEOPLE ( NAME, AGE ) VALUES ( '�����' , 40 ) ;
INSERT INTO PEOPLE ( NAME, AGE ) VALUES ( '������' , 25 ) ;
INSERT INTO PEOPLE ( NAME ) VALUES ( '������' ) ;
INSERT INTO PEOPLE ( NAME, AGE ) VALUES ( '����' , 40) ;