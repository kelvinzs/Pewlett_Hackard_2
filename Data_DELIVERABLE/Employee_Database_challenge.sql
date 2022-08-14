sql
-- Week7(Deliverable1)
SELECT e.emp_no,
       e.first_name,
	   e.last_name,
	   ts.title,
	   ts.from_date,
	   ts.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as ts
ON e.emp_no = ts.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;
-- 

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY (COUNT (title)) DESC;


-- Deliverable2 

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   s.title
INTO mentorship_eligibility
FROM employees AS e 
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN titles AS s
ON e.emp_no = s.emp_no
WHERE (de.to_date ='9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;