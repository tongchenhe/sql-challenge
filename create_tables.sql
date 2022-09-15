drop table if exists departments;
drop table if exists dept_emp;
drop table if exists dept_manager; 
drop table if exists employees;
drop table if exists salaries;
drop table if exists titles;

CREATE TABLE "departments" (
    "dept_no" char(4) PRIMARY KEY,
    "dept_name" varchar(50)   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int  PRIMARY KEY,
    "dept_no" char(4)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" char(4) NOT NULL,
    "emp_no" int   PRIMARY KEY
);


CREATE TABLE "employees" (
    "emp_no" int PRIMARY KEY,
    "emp_title_id" char(5)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" char(2)   NOT NULL,
    "hire_date" date   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int   PRIMARY KEY,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" char(5) PRIMARY KEY,
    "title" varchar(30)   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

