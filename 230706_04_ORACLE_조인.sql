-- 내부 조인

--1. 사원번호, 사원명, 부서번호, 부서명을 조회하시오.
SELECT E.EMPLOYEE_ID                                 AS 사원번호
     , CONCAT(CONCAT(E.FIRST_NAME,' '), E.LAST_NAME) AS 사원명
     , E.DEPARTMENT_ID                               AS 부서번호
     , D.DEPARTMENT_NAME                             AS 부서명           -- 2개의 테이블에 모두 있는 칼럼은 반드시 테이블(오너)을 명시해야 한다.
  FROM EMPLOYEES E, DEPARTMENTS D           -- INNER JOIN 대신 콤마(,)를 사용한다.
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;   -- ON 대신 WHERE을 사용한다.
    
--2. 사원번호, 사원명, 직업, 직업별 최대연봉, 직업별 최소연봉을 조회하시오
SELECT E.EMPLOYEE_ID                                 AS 사원번호
     , CONCAT(CONCAT(E.FIRST_NAME,' '), E.LAST_NAME) AS 사원명
     , E.JOB_ID                                      AS 직업번호
     , J.JOB_TITLE                                   AS 직업명
     , E.SALARY                                      AS 연봉
     , J.MAX_SALARY                                  AS 직업별_최대연봉
     , J.MIN_SALARY                                  AS 직업별_최소연봉
  FROM EMPLOYEES E, JOBS J
 WHERE E.JOB_ID = J.JOB_ID;
    
-- 외부 조인

--3. 모든 사원들의(부서가 없는 사원도 포함) 사원번호, 사원명, 부서번호, 부서명을 조회하시오.
SELECT EMPLOYEE_ID
     , CONCAT(CONCAT(FIRST_NAME,' '), LAST_NAME) AS 사원명
     , D.DEPARTMENT_ID
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E               -- 오른쪽 테이블(EMPLOYEES)의 모든 데이터를 조회한다.(부서번호가 없는 사원도 조회한다.)
 WHERE E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID;    -- RIGHT OUTER JOIN은 반대방향(LEFT)에 (+)를 추가해준다.
    
--4. 사원번호, 사원명, 부서번호, 부서명을 조회하시오. 사원이 근무하지 않는 유령 부서도 조회하시오.
SELECT EMPLOYEE_ID
     , CONCAT(CONCAT(FIRST_NAME,' '), LAST_NAME) AS 사원명
     , D.DEPARTMENT_ID
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E               -- 왼쪽 테이블(DEPARTMENTS)의 모든 데이터를 조회한다.(사원이 근무하지 않는 부서도 조회한다.)
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);    -- LEFT OUTER JOIN은 반대방향(RIGHT)에 (+)를 추가해준다.
    
-- 3개 이상 테이블 조인하기

--5. 사원번호, 사원명, 부서번호, 부서명, 근무지역을 조회하시오.
SELECT EMPLOYEE_ID                               AS 사원번호
     , CONCAT(CONCAT(FIRST_NAME,' '), LAST_NAME) AS 사원명
     , D.DEPARTMENT_ID                           AS 부서번호
     , DEPARTMENT_NAME                           AS 부서명
     , L.LOCATION_ID                             AS 근무번호
     , CITY                                      AS 근무지역
  FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
 WHERE L.LOCATION_ID   = D.LOCATION_ID
   AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;       -- OR 대신 AND로 사용한다.
    
--6. 부서번호, 부서명, 근무도시, 근무국가를 조회하시오.
SELECT DEPARTMENT_ID        AS 부서번호
     , DEPARTMENT_NAME      AS 부서명
     , CITY                 AS 근무도시
     , COUNTRY_NAME         AS 근무국가
  FROM COUNTRIES C, LOCATIONS L, DEPARTMENTS D
 WHERE C.COUNTRY_ID  = L.COUNTRY_ID
   AND L.LOCATION_ID = D.LOCATION_ID;