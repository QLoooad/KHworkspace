

SELECT EMP_NAME 사원명, FLOOR(ABS(HIRE_DATE - SYSDATE)) 근무일수1, FLOOR(SYSDATE - HIRE_DATE) 근무일수2
FROM EMPLOYEE;



SELECT EMP_ID, EMP_NAME, EMAIL, PHONE
FROM EMPLOYEE
WHERE MOD(EMP_ID, 2) = 1;


SELECT *
FROM EMPLOYEE
WHERE ABS((HIRE_DATE - SYSDATE)/365) > 20 ;



SELECT EMP_NAME, EMP_NO, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') 주민등록번호
FROM EMPLOYEE;



SELECT EMP_NAME, JOB_CODE, TO_CHAR((SALARY + (SALARY * NVL(BONUS, 0)))*12, 'L9,999,999,999') "연봉(원)"
FROM EMPLOYEE;



SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5', 'D9')
AND HIRE_DATE >= '04/01/01' AND HIRE_DATE <= '04/12/31';


SELECT EMP_NAME, HIRE_DATE ,
	EXTRACT (DAY FROM LAST_DAY(HIRE_DATE)) - EXTRACT (DAY FROM HIRE_DATE) + 1 
	"입사한 달의 근무 일수"
FROM EMPLOYEE;




SELECT EMP_NAME, DEPT_CODE, 
TO_CHAR(TO_DATE(SUBSTR(EMP_NO, 1, 6), 'RRMMDD'), 'RR"년" MM"월" DD"일"') "생년월일",
(SYSDATE - TO_DATE(SUBSTR(EMP_NO, 1, 6), 'RR MM DD'))/365.2422 "만 나이"
FROM EMPLOYEE;































































