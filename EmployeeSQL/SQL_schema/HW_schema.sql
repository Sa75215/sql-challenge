-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/k15IFM
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE titles (
    title_id varchar NOT NULL,
    title varchar(55) NOT NULL,
	PRIMARY KEY (
        title_id
     )
);

CREATE TABLE employees (
    emp_no integer NOT NULL,
    emp_title_id varchar NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(55) NOT NULL,
    last_name varchar(55) NOT NULL,
    sex varchar(15) NOT NULL,
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE departments (
    dept_no varchar NOT NULL,
    dept_name varchar(55) NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_manager (
    dept_no varchar NOT NULL,
    emp_no integer NOT NULL,
    PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_employee (
    emp_no integer NOT NULL,
    dept_no varchar NOT NULL,
    PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
