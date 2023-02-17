# Peer Review

## Ankit's Review :

**Q1 :**
```
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
```
- Here the first `SUM` function uses a conditional statement to count the number of male employees in each department. It checks if the "gender" column is "Male" and returns a 1 if true, and a 0 if false. The SUM function then adds up all the 1's to get the total number of male employees.
- Second `SUM` function works the same way as the previous one, but counts the number of female employees instead. It checks if the "gender" column is "Female" and returns a 1 if true, and a 0 if false. The SUM function is then used to add up all the 1's to get the total number of female employees.
- In the end the query groups the results by department using the `GROUP BY` clause and ordered by department using `ORDER BY` clause. This gives the total number of male and female employees in each department.

**Q2 :**

```
SELECT Name,
       CASE
           WHEN Jan>=Feb AND Jan>=Mar THEN Jan
           WHEN Feb>=Jan AND Feb>=Jan THEN Feb
           ELSE Mar
       END AS Value,
       CASE
           WHEN Jan>=Feb AND Jan>=Mar THEN 'Jan'
           WHEN Feb>=Jan AND Feb>=Jan THEN 'Feb'
           ELSE 'Mar'
       END AS Month
 FROM employee_info; 
```

- The query calculates the highest value among the three columns (Jan, Feb, and Mar) using a `CASE` statement. If the value in January is greater than or equal to February and March, then it selects January as the highest value.Similarly for the remaining as well.
- The query also determines which month has the highest value for each employee using another `CASE` statement. If January has the highest value, then it selects 'Jan' as the corresponding month. If February has the highest value, then it selects 'Feb'. Otherwise, it selects 'Mar'.

**Q3 :**

```
SELECT Marks, 
       RANK() OVER(ORDER BY Marks DESC) 'Rank',
       GROUP_CONCAT(CandidateID) AS CandidateID
FROM EXAM
GROUP BY Marks
ORDER BY Marks DESC;
```

- The query uses the `RANK()` function to assign a rank to each row based on the marks in descending order. The `GROUP_CONCAT()` function is used to concatenate the candidate IDs for each group of marks, and the GROUP BY clause is used to group the results by marks.
- The result set will be ordered by the marks in descending order.

**Q4 :**

```
create view Help_info as SELECT MIN(CandidateId) AS Candidate_ID
FROM Records
GROUP BY Email
ORDER BY Candidate_ID DESC ;
select * from Help_info;
--deleting
DELETE from records where candidateId not in
(select candidate_Id from Help_info); 
```

- Firstly a view called "Help_info" is created that selects the minimum CandidateId for each unique Email in the Records table, and then orders the results in descending order by the Candidate_ID.
- The second part of the SQL query is a `DELETE` statement that removes all records from the Records table where the CandidateId is not present in the Help_info view.
- This effectively deletes all but the oldest record for each unique email address in the Records table, as determined by the minimum CandidateId.

## Sonali's Review : 

**Q1 :**

```
SELECT IFNULL(DEPARTMENT,'Dept not assigned') AS DEPARTMENT,
    COUNT(CASE WHEN UPPER(GENDER)='Male' THEN 1 END) AS 'No of male',
    COUNT(CASE WHEN UPPER(GENDER)='Female' THEN 1 END) AS 'No of Female'
FROM EMPLOYEES
GROUP BY DEPARTMENT
ORDER BY DEPARTMENT;
```

- Here the first `COUNT` function uses a conditional statement to count the number of male employees in each department. It checks if the "gender" column is "Male" and returns a 1 if true. The COUNT function then counts up all the 1's returned to get the total number of male employees.
- Second `COUNT` function works the same way as the previous one, but counts the number of female employees instead. It checks if the "gender" column is "Female" and returns a 1 if true. The COUNT function is then used to count up all the 1's to get the total number of female employees.
- In the end the query groups the results by department using the `GROUP BY` clause and ordered by department using `ORDER BY` clause. This gives the total number of male and female employees in each department.

**Q2 :**

```
SELECT EMP_NAME as NAME,
  VALUE,
  CASE WHEN idx=1 THEN 'Jan'
       WHEN idx=2 THEN 'Feb'
       WHEN idx=3 THEN 'Mar'
  END AS MONTH
FROM (
SELECT
  EMP_NAME,
  GREATEST(Jan, Feb, Mar) AS VALUE,
  FIELD(GREATEST(Jan, Feb, Mar), Jan, Feb, Mar) as idx
FROM
  EMP_SALARIES
) EMP;
```

- Finds the maximum value from the columns "Jan", "Feb", and "March" and stores it in the "value" column.
- Determines the month corresponding to the maximum value using the "field" function, which returns the index of a value in a list of values, and stores the result in the "idx" column.
- Uses a "CASE WHEN" statement to convert the "idx" column into the month name (Jan, Feb, or Mar) and returns the result in the "Month" column.

**Q3 :**

```
SELECT MARKS,DENSE_RANK() OVER (ORDER BY MARKS DESC ) AS 'RANK', GROUP_CONCAT(CANDIDATE_ID) AS CANDIDATE_ID
FROM TEST
GROUP BY MARKS;
```

- Calculates the rank of each candidate based on their marks using `DENSE_RANK()`.
- Concatenates the candidate IDs for each group using `GROUP_CONCAT()`.

**Q4 :**

```
DELETE FROM EMAIL_IDS 
WHERE CANDIDATE_ID IN (SELECT TEMPCANDIDATE_ID FROM (SELECT DISTINCT A.CANDIDATE_ID as TEMPCANDIDATE_ID 
FROM EMAIL_IDS AS A 
INNER JOIN EMAIL_IDS AS B
WHERE A.EMAIL=B.EMAIL AND A.CANDIDATE_ID>B.CANDIDATE_ID) AS C) 
ORDER BY CANDIDATE_ID;
```

- The inner join operation in the subquery is used to find all the duplicate email ids.
- The subquery returns the candidate IDs with duplicate email addresses. 
- The `DELETE` statement deletes all these rows except the ones with the smallest candidate IDs.

