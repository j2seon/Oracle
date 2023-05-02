-- 프로시저(RPOCEDURE)
-- PL/SQL문을 저장하는 객체
-- 필요할 때마다 복잡한 구문을 다시 입력할 필요없이 
-- 호출을 통해 간단히 실행시키기위한 목적으로 사용된다.

CREATE TABLE EMP_DUP
AS
SELECT * 
    FROM EMPLOYEE;

SELECT
       *
    FROM EMP_DUP;

-- 프로시저 생성
CREATE OR REPLACE PROCEDURE DEL_ALL_EMP
IS
BEGIN
  DELETE
    FROM EMP_DUP
  COMMIT;
END;
/

DROP TABLE EMP_DUP;

-- 프로시저 실행
EXECUTE DEL_ALL_EMP;
EXEC DEL_ALL_EMP;

ROLLBACK;

-- 프로시져를 관리하는 데이터 딕셔너리
SELECT
      *
   FROM USER_SOURCE ;
   
-- 매개변수 있는 프로시저
CREATE OR REPLACE PROCEDURE DEL_EMP_ID
(
    V_EMP_ID EMPLOYEE.EMP_ID%TYPE
)
IS
BEGIN
   DELETE
      FROM EMPLOYEE E
    WHERE E.EMP_ID = V_EMP_ID;
END;
/

EXEC DEL_EMP_ID('&EMP_ID');

SELECT * FROM EMPLOYEE;
ROLLBACK;
SELECT * FROM EMPLOYEE;

-- IN/OUT 매개변수가 있는 푸로시져
CREATE OR REPLACE PROCEDURE SELECT_EMP_ID
(
   V_EMP_ID IN EMPLOYEE.EMP_ID%TYPE,
   V_EMP_NAME OUT EMPLOYEE.EMP_NAME%TYPE,
   V_SALARY OUT EMPLOYEE.SALARY%TYPE,
   V_BONUS OUT EMPLOYEE.BONUS%TYPE
)
IS
BEGIN
   SELECT E.EMP_NAME
        , E.SALARY
        , NVL(E.BONUS, 0)
     INTO V_EMP_NAME
        , V_SALARY
        , V_BONUS
     FROM EMPLOYEE E
    WHERE E.EMP_ID = V_EMP_ID;
END;
/

VARIABLE VAR_EMP_NAME VARCHAR2(30);
VARIABLE VAR_SALARY VARCHAR2(30);
VARIABLE VAR_BONUS VARCHAR2(30);

EXEC SELECT_EMP_ID(201, :VAR_EMP_NAME, : VAR_SALARY, :VAR_BONUS)

PRINT VAR_EMP_NAME;
PRINT VAR_SALARY;
PRINT VAR_BONUS;

SET AUTOPRINT ON; 
