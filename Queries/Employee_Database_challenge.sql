-- DELIVERABLE 1
-- Create Retirement Titles
SELECT e.emp_no,
        e.first_name,
        e.last_name,
        t.title,
        t.from_date,
        t.to_date
INTO retirement_titles
FROM employees as e 
INNER JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;

-- Create Unique Titles
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
					rt.first_name,
					rt.last_name,
					rt.title
INTO unique_titles
FROM retirement_titles as rt 
ORDER BY rt.emp_no , rt.from_date DESC;

-- Create Retiring Titles
-- Number of employees by their most recent job title
SELECT COUNT(ut.title), ut.title
INTO retiring_titles 
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;


-- DELIVERABLE 2
-- Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibilty    
FROM employees as e 
INNER JOIN dept_emp as de 
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t 
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31');