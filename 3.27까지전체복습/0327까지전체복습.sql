SELECT ����ID
     , TO_CHAR(�Ի��Ͻ�, 'YY/MM/DD') AS �Ի��Ͻ�
     , TO_CHAR(ADD_MONTHS(�Ի��Ͻ�, 60), 'YY/MM/DD') AS �������Ի��Ͻ�
  FROM ����
 ORDER BY ����ID ;

SELECT SYSDATE + 3 
  FROM DUAL ;
  
SELECT TO_NUMBER('12') FROM DUAL ;
SELECT TO_CHAR(111) FROM DUAL ;
  
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') FROM DUAL ;  
SELECT TO_DATE('20230101' , 'YYYY/MM/DD') FROM DUAL ;
SELECT TO_DATE('20230101010101' , 'YYYYMMDDHH24MISS') FROM DUAL ;

--�ǽ�1
SELECT ����ID
     , �Ի��Ͻ�
     , TO_CHAR(�Ի��Ͻ�, 'YYYY') AS �Ի翬��
  FROM ���� ;
  
SELECT '1' + 1 FROM DUAL ; --2

--1.
SELECT ����ID
     , ����
     , ���� + 1 AS ���س���
  FROM ����;
  
--NVL �Լ�
--NVL(a,b) : if(a == null) return b; if(a!=null) return a;
SELECT ����ID
     , ����
     , NVL(����, 0)
  FROM ���� ;
--NVL2(a,b,c) : if(a==null) return c; if(a!=null) return b;
SELECT ����ID
     , ����
     , NVL2(����, ����, 100)
  FROM ���� ;

--DECODE
SELECT ����ID
     , ����
     , DECODE(����,NULL, 100, ����) 
  FROM ���� ;
  
--1.
SELECT ����ID
     , ��й�ȣ
     , NVL(����, 20) AS ����
  FROM ���� ;
  
--2.
SELECT ����ID
     , ����
     , ����
     , DECODE(����, '��', '�����Դϴ�', '�����Դϴ�') AS ����Ȯ�� 
  FROM ���� ;
  
--------------------------------------- WHERE -----------------------------------------------
SELECT *
  FROM ����
 WHERE �Ի��Ͻ� BETWEEN TO_DATE('20150101000000','YYYYMMDDHH24MISS')
                                 AND TO_DATE('20151231235959','YYYYMMDDHH24MISS')
    OR �Ի��Ͻ� IS NULL ;
    
--����3
SELECT *
  FROM ����
 WHERE �Ի��Ͻ� >= '20170101' ;
 
SELECT �μ�ID
     , MAX(����) AS �μ����ְ���
  FROM ����
 GROUP BY �μ�ID
 ORDER BY �μ�ID ;
 

SELECT *
  FROM (
          SELECT * 
          FROM �Խ���
         ORDER BY �ۼ��Ͻ� DESC 
        )
 WHERE ROWNUM <=100 ;

  
