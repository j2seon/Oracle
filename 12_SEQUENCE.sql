-- 시퀀스(SEQUENCE) 
-- 자동 번호 발생기 역할을 하는 객체
-- 순차적으로 정수값을 자동으로 생성해준다. 

CREATE SEQUENCE SEQ_EMP_ID -- SEQ_기본키명
START WITH 300 
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;

SELECT * FROM USER_SEQUENCES;

-- CURRVAL 현재 시퀀스 번호를 조회할 때 사용
-- 사용하려는 시퀀스명.CURRVAL

-- NEXTVAL 1회 수행 후 실행 가능
SELECT SEQ_EMP_ID.CURRVAL FROM DUAL; --시퀀스 SEQ_EMP_ID.CURRVAL은 이 세션에서는 정의 되어 있지 않습니다

-- NEXTVAL : 시퀀스를 호출한다.
SELECT SEQ_EMP_ID.NEXTVAL FROM DUAL;
SELECT SEQ_EMP_ID.NEXTVAL FROM DUAL;
SELECT SEQ_EMP_ID.NEXTVAL FROM DUAL;
SELECT SEQ_EMP_ID.NEXTVAL FROM DUAL; -- 시퀀스 SEQ_EMP_ID.NEXTVAL exceeds MAXVALUE은 사례로 될 수 없습니다

-- 시퀀스 변경
ALTER SEQUENCE SEQ_EMP_ID
-- START WITH 1 -- 시작점의 내용은 쓸수 없다 
INCREMENT BY 10
MAXVALUE 400;

SELECT * FROM USER_SEQUENCES;

--START WITH 값은 변경이 불가능하다.
--START WITH 값을 변경시에는 DROP으로 삭제 후 다시생성해야한다.
ROLLBACK;

-- SELECT문에서 사용 가능
-- INSERT문에서 SELECT 구문 사용가능
-- INSERT문에서 VALUES절에서 사용가능
-- UPDATE문에서 SET절에서 사용가능

/* 
    단, 서브쿼리의 SELECT문에서 사용 불가
    VIEW의 WELECT 절에서 사용 불가
    DISTINCT키워드가 있는 SELECT문에서 사용불가
    GROUP BY, HAVING절이 있는 SELECT문에서 사용불가
    ORDER BY 절에서 사용불가
    CREATE TABLE, ALTER TABLE의 DEFAULT 값으로 사용불가
*/

CREATE SEQUENCE SEQ_EMPID
START WITH 300 
INCREMENT BY 1
MAXVALUE 10000
NOCYCLE
NOCACHE;

SELECT * FROM USER_SEQUENCES;

INSERT 
    INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, 
                  DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY
                  ,BONUS,MANAGER_ID,HIRE_DATE,ENT_DATE,ENT_YN
                  )
    VALUES
    (
        SEQ_EMPID.NEXTVAL, '홍길동', '661212-1234567', 'HONG@GREEDY.COM', '01011111111',
        'D2', 'J1', 'S1', 5000000, 0.2,
        200, SYSDATE, NULL, 'N'
    );

SELECT * FROM EMPLOYEE;
ROLLBACK;

CREATE SEQUENCE SEQ_EMPID2;
