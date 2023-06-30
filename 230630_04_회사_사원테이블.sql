--생성 전에 테이블 삭제
DROP TABLE PROCEEDING_T;
DROP TABLE PROJECT_T;
DROP TABLE EMPLOYEE_T;
DROP TABLE DEPARTMENT_T;


--부서 테이블
CREATE TABLE DEPARTMENT_T(
    DEPT_NO       VARCHAR2(15) NOT NULL,
    DEPT_NAME     VARCHAR2(30),
    DEPT_LOCATION VARCHAR2(50),
    CONSTRAINT PK_DEPT PRIMARY KEY(DEPT_NO)
);

--사원 테이블
CREATE TABLE EMPLOYEE_T(
    EMP_NO     NUMBER       NOT NULL,
    DEPT_NO    VARCHAR2(15),
    POSITION   CHAR(10),
    NAME       VARCHAR2(15),
    HIRE_DATE  DATE,
    SALARY     NUMBER,
    CONSTRAINT PK_EMP PRIMARY KEY(EMP_NO),
    CONSTRAINT FK_DEPT_EMP FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT_T(DEPT_NO) ON DELETE SET NULL     --부서가 삭제되면 사원들의 해당 부서 정보만 NULL처리한다.
);

--프로젝트 테이블
CREATE TABLE PROJECT_T(
    PJT_NO     NUMBER   NOT NULL,
    PJT_NAME   VARCHAR2(30),
    BEGIN_DATE DATE,
    END_DATE   DATE,
    CONSTRAINT PK_PJT PRIMARY KEY(PJT_NO)
);

--프로젝트 진행 테이블
CREATE TABLE PROCEEDING_T(
    PCD_NO    NUMBER NOT NULL,
    EMP_NO    NUMBER NOT NULL,
    PJT_NO    NUMBER NOT NULL,
    PJT_STATE NUMBER NOT NULL,
    CONSTRAINT PK_PCD PRIMARY KEY(PCD_NO),
    CONSTRAINT FK_EMP_PCD FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE_T(EMP_NO) ON DELETE CASCADE,  --사원이 삭제되면 프로젝트 진행명단에서 함께 삭제된다.
    CONSTRAINT FK_PJT_PCD FOREIGN KEY(PJT_NO) REFERENCES PROJECT_T(PJT_NO) ON DELETE CASCADE    --프로젝트가 삭제되면 프로젝트 진행명단에서 함께 삭제된다.
);