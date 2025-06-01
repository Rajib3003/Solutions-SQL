
1. What is PostgreSQL?
Answer: PostgreSQL is an open source object relational database management system. 

2. What is the purpose of a database schema in PostgreSQL?
Answer: In postgreSQL a schema is a logical structure that organizes objects such as tables, views, indexs, types, functions etc. a database and keeps them is separate namespaces. 

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Answer: 
Primary key: A primary key is a column or set of columns in a table that uniquely identifies a row in the table and distinguishes it from other columns. 
Foreign key: When a primary key creates a relationship with another table, it is called a foreign key. 

4. What is the difference between the VARCHAR and CHAR data types?
Answer: 
VARCHAR: It only takes up as much space as it is written.
CHAR: Always takes up (n) characters, filled with spaces if less. 

5. Explain the purpose of the WHERE clause in a SELECT statement.
Answer: The WHERE clasuse is used to filter data based on conditions. 

6. What are the LIMIT and OFFSET clauses used for?.
Answer: 
LIMIT: This clause is used to limit the number of rows returned. 
OFFSET: This clause tells SQL to skip a number of rows before starting to return the results. 

7. How can you modify data using UPDATE statements?
Answer: 
UPDATE (table name) SET name = '(update value)', age = (update value) WHERE id = (update value id);

8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
Answer: In SQL a JOIN is used to combine rows from two or more tables based on a related column between them.

9. Explain the GROUP BY clause and its role in aggregation operations.
Answer: The group by clause in SQL is use to group rows that have the same values in specified coloumns.

10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
Answer: Aggregate functions in SQL are used to perform a calculation on a set of rows and return a single value. 
        COUNT(): counts how many rows are present
                Example: Select count(*) from tableName;
        SUM(): adds up values in a muneric colum
                Example: Select SUM(amount) from tableName;
        AVG(): Calculates the average of values
                Example: Select AVG(amount) from tableName;





