-- 1-List the following details of each employee: employee number, last name, first name, sex, and salary.

Select  employees.emp_no as "Employe Number",
		employees.last_name as  "Last name",
	    employees.first_name as "First name",
	    employees.sex as "SEX",
	   (select salaries.salary from salaries
	  				where salaries.emp_no = employees.emp_no) as Salary
		from employees
order by employees.emp_no;


-- 2-List first name, last name, and hire date for employees who were hired in 1986.

Select  employees.emp_no as "Employe Number",
		employees.last_name as  "Last name",
	    employees.first_name as "First name",
	    employees.hire_date as "Hired On"
	   	from employees
		where right(employees.hire_date,4)= '1986'
order by employees.emp_no;
-- 3 List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select  dept_manager.dept_no as "department number",
		departments.dept_name as "department name",
		employees.emp_no as "Employe Number",
		employees.last_name as  "Last name",
	    employees.first_name as "First name"
	    from employees
		Inner join dept_manager
		on employees.emp_no = dept_manager.emp_no
		Inner join departments
		on departments.dept_no=dept_manager.dept_no
order by employees.emp_no;


--4-List the department of each employee with the following information: employee number, last name, first name, and department name.


select  employees.emp_no as "Employe Number",
		employees.last_name as  "Last name",
	    employees.first_name as "First name",
		departments.dept_name as "department name"
	    from employees
		Inner join dept_emp
		on dept_emp.emp_no=employees.emp_no
		Inner join departments
		on departments.dept_no=dept_emp.dept_no
order by employees.emp_no;
		




--5-List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

Select  employees.emp_no as "Employe Number",
	    employees.first_name as "First name",
		employees.last_name as  "Last name",
	    employees.sex as "SEX"
		from employees
		where employees.first_name = 'Hercules'
		and employees.last_name like 'B%'
order by employees.emp_no;
		

---6-List all employees in the Sales department, including their employee number, last name, first name, and department name.
--- with Select
select  employees.emp_no as "Employe Number",
		employees.last_name as  "Last name",
	    employees.first_name as "First name",
		departments.dept_name as "Department"
from employees ,departments
where departments.dept_name='Sales' and
		employees.emp_no in 
		(
		select dept_emp.emp_no from dept_emp
		where dept_emp.dept_no in
			(
			select departments.dept_no from departments
			where departments.dept_name = 'Sales' ))
order by employees.emp_no;

--- With join:

select  employees.emp_no as "Employe Number",
		employees.last_name as  "Last name",
	    employees.first_name as "First name",
		departments.dept_name as "department name"
	    from employees
		Inner join dept_emp
		on dept_emp.emp_no=employees.emp_no
		Inner join departments
		on departments.dept_no=dept_emp.dept_no
where 		(departments.dept_name='Sales')

order by employees.emp_no;



--7-List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select  employees.emp_no as "Employe Number",
		employees.last_name as  "Last name",
	    employees.first_name as "First name",
		departments.dept_name as "department name"
	    from employees
		Inner join dept_emp
		on dept_emp.emp_no=employees.emp_no
		Inner join departments
		on departments.dept_no=dept_emp.dept_no
where 		(departments.dept_name='Sales' or departments.dept_name='Development')

order by employees.emp_no;


--8-In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select		employees.last_name as  "Last name", count(employees.last_name) as "Count"
		from  employees
		group by employees.last_name
order by "Count" desc