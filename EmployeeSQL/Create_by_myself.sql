create table departments 
(dept_no varchar(5),
 dept_name varchar(30),
 primary key (dept_no)
);

create table titles 
(title_id varchar(10),
 title varchar(30),
 primary key (title_id)
);

create table employees 
(emp_no int,
 emp_title_id varchar(10),
 birth_date varchar(10),
 first_name varchar(30),
 last_name varchar(30),
 sex varchar(10),
 hire_date varchar(10),
 primary key (emp_no),
 foreign key (emp_title_id) REFERENCES titles (title_id)
 );

create table salaries	 
(emp_no int,
 salary int,
 primary key (emp_no),
 foreign key (emp_no) REFERENCES employees (emp_no)
);

create table dept_manager		 
(emp_no int,
 dept_no varchar(5),
 primary key (emp_no),
 foreign key (emp_no) REFERENCES employees (emp_no),
 foreign key (dept_no) REFERENCES departments (dept_no)
);

create table dept_emp		 
(emp_no int,
 dept_no varchar(5),
 primary key (emp_no,dept_no),
 foreign key (emp_no) REFERENCES employees (emp_no),
 foreign key (dept_no) REFERENCES departments (dept_no)
);