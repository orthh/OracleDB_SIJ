SELECT A.����ȣ
     , A.����
     , B.��ȭ��ȣ
  FROM �� A
     , ����ȭ��ȣ B
 WHERE A.����ȣ = B.����ȣ
   AND A.����ȣ = '0001'
   AND B.��ȭ�����ڵ� = '����ȭ' ;
   
SELECT A.����ID AS ����_����ID
     , A.����
     , A.����
     , B.����ID AS �ּ�_����ID
     , B.�����ڵ�
     , B.�ּ�
  FROM ���� A
     , �����ּ� B
 WHERE A.����ID = B.����ID 
   AND A.����ID = 'A0007' ;
   
--3
   
SELECT A.����ID AS ����_����ID
     , A.�̸�
     , A.����
     , B.����ID AS �ּ�_����ID
     , B.�����ڵ�
     , B.�ּ�
  FROM ���� A
     , �����ּ� B
 WHERE A.����ID = B.����ID(+) 
   AND B.�ּ� IS NULL ;
   
--5
SELECT A.����ID
     , A.�̸�
     , A.����
     , B.����ó
     , C.�ּ�
  FROM ���� A
     , ��������ó B
     , �����ּ� C
 WHERE A.����ID = B.����ID
   AND A.����ID = C.����ID ;
   
--6
SELECT A.����ID
     , A.�̸�
     , A.�Ի��Ͻ�
     , B.����ó
  FROM ���� A
     , ��������ó B
 WHERE A.����ID = B.����ID
   AND A.����ID IN ('A0001','A0002','A0003')
   AND B.�����ڵ� = '�޴���' ;
   
--7
SELECT A.����ID
     , A.�̸�
     , A.�μ�ID
     , B.�μ���
  FROM ���� A
     , �μ� B
 WHERE A.�μ�ID = B.�μ�ID ;
 
--1.
SELECT A.����ID
     , A.�̸�
     , B.�ּ�
  FROM ���� A LEFT OUTER JOIN �����ּ� B
    ON (A.����ID = B.����ID)
 WHERE A.����ID IN ('A0005','A0008') ;
 
--2.
SELECT B.����ID
     , B.�̸�
     , A.�ּ�
  FROM �����ּ� A RIGHT OUTER JOIN ���� B
    ON A.����ID = B.����ID ;
    
--3
SELECT