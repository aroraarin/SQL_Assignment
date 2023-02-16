# SQL ASSIGNMENT 

## Answer 1 :

  `employee` table :  

  [![Screenshot-2023-02-13-at-11-27-45-AM.png](https://i.postimg.cc/VvGXjymh/Screenshot-2023-02-13-at-11-27-45-AM.png)](https://postimg.cc/q6KtT5tc)  

  Query :  

  [![Screenshot-2023-02-13-at-11-35-44-AM.png](https://i.postimg.cc/3RCLDYwp/Screenshot-2023-02-13-at-11-35-44-AM.png)](https://postimg.cc/5Yy5hcLN)  

  Output :  

  [![Screenshot-2023-02-13-at-11-37-40-AM.png](https://i.postimg.cc/cJBhrbgp/Screenshot-2023-02-13-at-11-37-40-AM.png)](https://postimg.cc/R3qKYGTd)  

  Approach :  

   Used the `CASE` expression to count the total number of male and female employees and used `GROUP BY` clause to seperate them on the basis of departments.
  


## Answer 2 :
  
  `salaries` table :  
  
  [![Screenshot-2023-02-13-at-11-43-36-AM.png](https://i.postimg.cc/jdrjXx8Y/Screenshot-2023-02-13-at-11-43-36-AM.png)](https://postimg.cc/5jn19Vds)
  
  Query :
  
  [![Screenshot-2023-02-13-at-11-45-41-AM.png](https://i.postimg.cc/hjPLh8dM/Screenshot-2023-02-13-at-11-45-41-AM.png)](https://postimg.cc/R3y6DHGn)
  
  OUTPUT :
  
  [![Screenshot-2023-02-13-at-12-06-23-PM.png](https://i.postimg.cc/y8wPvpbG/Screenshot-2023-02-13-at-12-06-23-PM.png)](https://postimg.cc/G4xGpKrP)
  
  Approach :
    
   Took union of columns 'Jan' , 'Feb' , 'Mar' and selected the max using the `MAX` function, then used the `CASE` expression to find out which month had the highest value.

## Answer 3 :

  `marks` table :
  
  [![Screenshot-2023-02-13-at-11-51-13-AM.png](https://i.postimg.cc/P5S3yqQ6/Screenshot-2023-02-13-at-11-51-13-AM.png)](https://postimg.cc/CRfsLStD)
  
  Query :
  
  [![Screenshot-2023-02-13-at-11-52-30-AM.png](https://i.postimg.cc/Cx5HFsbN/Screenshot-2023-02-13-at-11-52-30-AM.png)](https://postimg.cc/nX8Q27Rj)
  
  Output :
  
  [![Screenshot-2023-02-13-at-12-07-20-PM.png](https://i.postimg.cc/MTGvRqYJ/Screenshot-2023-02-13-at-12-07-20-PM.png)](https://postimg.cc/CZWhpytc)
  
  Approach :
   
   Created a 'rank' variable to create the rank column and updated it in every row. Used `GROUP_CONCAT` function to display all the common candidate IDs in one cell.
   
   ## Answer 4 :
   
   `emails` table :
   
   [![Screenshot-2023-02-13-at-11-57-00-AM.png](https://i.postimg.cc/wj5C5H1M/Screenshot-2023-02-13-at-11-57-00-AM.png)](https://postimg.cc/tsTvyKtG)
   
   Query :
   
   [![Screenshot-2023-02-16-at-6-47-18-PM.png](https://i.postimg.cc/zf2cS1k0/Screenshot-2023-02-16-at-6-47-18-PM.png)](https://postimg.cc/XZFL4mmC)
   
   Output :
   
   [![Screenshot-2023-02-13-at-12-08-04-PM.png](https://i.postimg.cc/MHQZbTMN/Screenshot-2023-02-13-at-12-08-04-PM.png)](https://postimg.cc/hQKqKK01)
   
   Approach :
    
   Used the `MIN` aggregate function to get the smalled candidate ID and `GROUP BY` clause to group the candidates on the basis of their emails the used this query as a subquery to delete those records which do not match with the selected outputs from the subquery.
  
   
    
