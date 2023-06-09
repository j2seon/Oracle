SET SERVEROUTPUT ON;

-- PL / SQL

DECLARE 
   EMP_ID2 NUMBER;
   EMP_NAMES VARCHAR2(20);
BEGIN
   EMP_ID2 := 77;
   EMP_NAMES := '이름';
   
   DBMS_OUTPUT.PUT_LINE(EMP_ID2);
   DBMS_OUTPUT.PUT_LINE(EMP_NAMES);
END;
/

DECLARE 
  EMP_ID EMPLOYEE.EMP_ID%TYPE;
  EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN 
   SELECT 
         E.EMP_ID,
         E.EMP_NAME
     INTO EMP_ID,
          EMP_NAME
     FROM EMPLOYEE E
     WHERE E.EMP_ID = '&EMP';     
   DBMS_OUTPUT.PUT_LINE(EMP_ID);
   DBMS_OUTPUT.PUT_LINE(EMP_NAME);  
END;
/
select * from employee;
