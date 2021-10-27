-- Accessing Multiple Tables with Sub-Queries
-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from employees
where job_id in (select job_ident from jobs);

-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
select * from employees
where job_id in
(select job_ident from jobs where job_title = 'Jr. Designer');

-- Retrieve JOB information and list of employees who earn more than $70,000.
select * from jobs
where job_ident in
(select job_id from employees where salary > 70000);

-- Retrieve JOB information and list of employees whose birth year is after 1976.
select * from jobs
where job_ident in
(select job_id from employees where year(b_date)>1976);

-- Retrieve JOB information and list of female employees whose birth year is after 1976.
select * from jobs
where job_ident in
(select job_id from employees where year(b_date)>1976 and sex='F');

-- Accessing Multiple Tables with Implicit Joins
-- Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
select * from employees, jobs;

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table
-- Redo the previous query, using shorter aliases for table names.
select * from employees E, jobs J
where E.job_id = J.job_ident;

-- Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title
select EMP_ID, F_NAME, L_NAME, JOB_TITLE from employees E, jobs J
where E.job_id = J.job_ident;

-- Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause
select E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE from employees E, jobs J
where E.job_id = J.job_ident;



