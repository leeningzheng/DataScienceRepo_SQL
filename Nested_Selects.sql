--Error message: Invalid use of an aggregate function or OLAP function
-- select * from employees where salary <AVG(salary);

select * from employees
where salary < (select AVG(salary) from employees);

-- Error message
-- An expression starting with "SALARY" specified in a SELECT clause, HAVING clause, or ORDER BY clause is not specified in the GROUP BY clause or it is in a SELECT clause, HAVING clause, or ORDER BY clause with a column function and no GROUP BY clause is specified
--select EMP_ID, SALARY, MAX(SALARY) as MAX_SALARY from employees;

select EMP_ID, SALARY, (select MAX(SALARY) from employees) as MAX_SALARY from employees;

select * from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) AS EMP4ALL;
