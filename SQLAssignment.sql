CREATE DATABASE assignment;
USE assignment;

-- Answer 1 
CREATE TABLE employees(
	EmpID INT PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    Gender VARCHAR(20) NOT NULL,
    Department VARCHAR(20) NOT NULL
);

INSERT INTO employees VALUES(1,'X', 'Female', 'Finance');
INSERT INTO employees VALUES(2,'Y', 'Male', 'IT');
INSERT INTO employees VALUES(3,'Z', 'Male', 'HR');
INSERT INTO employees VALUES(4,'W', 'Female', 'IT');

SELECT * FROM employees;

SELECT Department, 
SUM(CASE
		WHEN Gender='Male' THEN 1 
        ELSE 0 END
	) as 'Num of males',
SUM(CASE
		WHEN Gender='Female' THEN 1 
        ELSE 0 END
	) as 'Num of females' 
FROM employees 
GROUP BY Department
ORDER BY Department;


-- Answer 2
CREATE TABLE salaries(
	Name VARCHAR(20),
    Jan INT,
    Feb INT,
    Mar int
);

INSERT INTO salaries VALUES('X', 5200, 9093, 3832);
INSERT INTO salaries VALUES('Y', 9023, 8942, 4000);
INSERT INTO salaries VALUES('Z', 9834, 8197, 9903);
INSERT INTO salaries VALUES('W', 3244, 4321, 0293);

SELECT * FROM salaries;

SELECT Name, 
(SELECT MAX(maxSal) maxSal FROM 
	(SELECT salaries.Jan AS maxSal 
		UNION 
        SELECT salaries.Feb 
        UNION 
        SELECT salaries.Mar
	) AS a
) as Value,
(SELECT(
		CASE 
			WHEN Value=salaries.Jan THEN 'Jan' 
			WHEN Value=salaries.Feb THEN 'Feb' 
			WHEN Value=salaries.Mar THEN 'Mar' 
			END
		)
) as Month
FROM salaries;

-- Answer 3
CREATE TABLE marks(
	Candidate_ID INT PRIMARY KEY,
    Marks int
);

INSERT INTO marks VALUES(1, 98);
INSERT INTO marks VALUES(2, 78);
INSERT INTO marks VALUES(3, 87);
INSERT INTO marks VALUES(4, 98);
INSERT INTO marks VALUES(5, 78);

SET @a=0;
SELECT 
	Marks, 
	@a := @a+1 as 'Rank', 
	GROUP_CONCAT(Candidate_ID) as Candidate_ID 
FROM marks 
GROUP BY Marks 
ORDER BY Marks DESC;


-- Answer 4
CREATE TABLE emails(
	Candidate_id INT PRIMARY KEY,
    Email VARCHAR(30)
);

INSERT INTO emails VALUES(45, 'abc@gmail.com');
INSERT INTO emails VALUES(23, 'def@gmail.com');
INSERT INTO emails VALUES(34, 'abc@gmail.com');
INSERT INTO emails VALUES(21, 'bcf@gmail.com');
INSERT INTO emails VALUES(94, 'def@gmail.com');

SELECT MIN(Candidate_id) as Candidate_id, Email FROM emails GROUP BY Email ORDER BY Candidate_id DESC;  
