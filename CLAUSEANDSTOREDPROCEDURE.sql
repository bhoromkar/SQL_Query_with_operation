use Northwind;

--group by clause
select country ,count(*) as No_of_Suppliers from suppliers group by country;
select categoryid , sum(price) as Total_categoryPrice from products group by categoryid;
select productid ,max(price) as Max_Price , min(price) as Min_Price  from products group by productid;
select categoryid ,max(price) as Max_Price , min(price) as Min_Price, avg(price) as Avg_Price  from products group by categoryid;
select categoryid, count(productname) as no_of_product_to_supplier from products group by categoryid ;
select supplierid,categoryid, count(productname) as no_of_product_to_supplier from products group by supplierid,categoryid ;
select supplierid, count(productname) as no_of_product_to_supplier from products group by supplierid;

--having clause keyword  i have to filter a data after group by 
-- HAVING CLAUSE IS ALWAYS USED WITH GROUP BY CLAUSE
select country ,count(*) as No_of_Suppliers from suppliers group by country HAVING COUNTRY IN ('USA', 'UK');
select productid ,max(price) as Max_Price , min(price) as Min_Price  from products group by productid HAVING max(price)>50;
select categoryid,avg(price) as Avg_price from products  group by ProductName,categoryid Having avg(price)<30; 

--joins
--inner joins

select * from customers;
select * from orders;
select * from Products;
select * from Suppliers;
--inner joins\
select * from customers 
inner join orders 
on Customers.CustomerID = orders.CustomerID
where city = 'london';

select Orders.CustomerID,Customers.CustomerID, orders.OrderID,Customers.ContactName from customers 
inner join orders 
on Customers.CustomerID = orders.CustomerID;

select orders.*, customers.*from orders inner join Customers on  customers.CustomerID =Orders.CustomerID;

--right join
select Orders.CustomerID,Customers.CustomerID, orders.OrderID,Customers.ContactName from customers 
left join orders 
on Customers.CustomerID = orders.CustomerID;

select Orders.CustomerID,Customers.CustomerID, orders.OrderID,Customers.ContactName from customers 
right join orders 
on Customers.CustomerID = orders.CustomerID;


select Orders.CustomerID,Customers.CustomerID, orders.OrderID,Customers.ContactName from customers 
full outer join orders 
on Customers.CustomerID = orders.CustomerID;

select Customers.*, suppliers.* from customers right join suppliers on suppliers.city = Customers.City
--left join

select Orders.CustomerID,Customers.CustomerID, orders.OrderID,Customers.ContactName from customers 
left join orders 
on Customers.CustomerID = orders.CustomerID;
  
select Customers.*, suppliers.* from customers left join suppliers on suppliers.city = Customers.City
--full outer join
select Customers.*, suppliers.* from customers full outer join suppliers on suppliers.city = Customers.City



-- StoredProcedure
-- dont use sp_ it is already in master database
-- HOW TO CREATE PROCEDURE
Create procedure SpCustomer_city
AS
Begin 
SELECT * FROM Customers WHERE CITY = 'LONDON';
END
GO

-- FOR EXECUTION OF STORED PROCEDURE 
SpCustomer_city
Execute SpCustomer_city
EXEC SpCustomer_city

---MODIFY STORED PROCEDURE
ALTER proc SpCustomer_city
AS
Begin 
SELECT * FROM Customers WHERE CITY = 'LONDON';
SELECT * FROM Customers WHERE CITY = 'BERLIN';
END
GO
SpCustomer_city

---DROP PROCEDURE
DROP PROC SpCustomer_city

--PARAMETER IN STORED PROCEDURE
Create proc SpCustomer_location 
@city_name varchar(100),
@country_name VARCHAR(100)
AS
Begin 
SELECT * FROM Customers WHERE CITY = @city_name;
SELECT * FROM Customers WHERE  Country= @country_name;
END
GO 

-- EXEC SpCustomer_location 'LONDON','FRANCE'
EXEC SpCustomer_location @country_name = 'FRANCE',@city_name = 'LONDON'

--DEFAULT PARAMAETER

Create proc SpCustomer_location1 
@city_name varchar(100)='MADRID',
@country_name VARCHAR(100)='CANADA'
AS
Begin 
SELECT * FROM Customers WHERE CITY = @city_name;
SELECT * FROM Customers WHERE  Country= @country_name;
END
GO 
--IN CASE DEFAULT PARMETER IF I PASSES SOME VALUE THEN IN PARAMETER THEN DEFAULT VALUE WILL BE IGNORED. 
SpCustomer_location1 'LONDON','UK'

--OUTPUT PARAMETER
CREATE PROC spAddNum1
@num1 int,
@num2 int,
@result int output
with encryption  --encrypted
AS
begin 
set @result = @num1+@num2;
end
GO
declare @eId int --declare new variable
exec spAddNum1 4,4,@eId output;
SELECT @eId AS REUSLT_ADIITION; -- GETTING OUTPUT

CREATE PROC spAddNum
@num1 int,
@num2 int,
@result int output
with encryption  --encrypted
AS
begin 
set @result = @num1+@num2;
end
GO
declare @eId int --declare new variable
exec spAddNum 4,4,@eId output;
SELECT @eId AS REUSLT_ADIITION; -- GETTING OUTPUT
--STORED PROCEDURE SECURITY WITH ENCRYPTION
sp_helpText spAddNum1

  --WILDCARDS

  SELECT * FROM Employees WHERE firstname LIKE 'a%'; -- name stARTS WITH A
    SELECT * FROM Employees WHERE firstname LIKE '%a'; --name ends with a
	 SELECT * FROM Employees WHERE firstname LIKE '%a%'; -- AT ANY POSITION


	 --UNNDERSCORE 
	 SELECT * FROM Employees WHERE firstname LIKE '_'; --IF FIRST NAME HAS ONE CHARCTEER
	 SELECT * FROM Employees WHERE firstname LIKE 'A_____' ;--IF CHARACTER HAS TWO CHARACTER

	 ---LIST OF CHARACTER
	  SELECT * FROM Employees WHERE firstname LIKE '[AB]%' ; --IF ANY CHARACTERS MATCH

	  --WITHIN RANGE
	  SELECT * FROM Employees WHERE firstname LIKE '[A-P]%' ; --find character in range

	  select * from Employees

	  use HospitaldB;
	  select * from Patient;
