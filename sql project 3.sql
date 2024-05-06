                                    --- MYSQL PROJECT 3.0 ---

use northwind;
select*from order_details;
select* from orders;

#Calculate average Unit Price for each CustomerId.
select customerid ,unitprice, avg(unitprice) over (partition by customerid) as "avg unit price"   from orders join order_details on 
orders.orderid=order_details.orderid;

# Calculate average Unit Price for each group of CustomerId AND EmployeeId.
select customerid,employeeid ,avg(unitprice)  over(partition by customerid,employeeid) as "avg unit price" from orders join order_details
 on orders.orderid=order_details.orderid;
 
# Rank Unit Price in descending order for each CustomerId.
select customerid,unitprice, row_number() over (partition by customerid order by unitprice desc) as " avg rank unit price" from  orders join order_details
 on orders.orderid=order_details.orderid;
 
 #How can you pull the previous order date’s Quantity for each ProductId.
 select quantity,orderdate,productid ,lag(quantity) over(partition by productid order by orderdate) as "pre quantity" from orders join order_details 
 on orders.orderid=order_details.orderid;
 
# How can you pull the following order date’s Quantity for each ProductId.
 select quantity,orderdate,productid ,lead(quantity) over(partition by productid order by orderdate)  as " following quantity "from orders join order_details 
 on orders.orderid=order_details.orderid;
 
# Pull out the very first Quantity ever ordered for each ProductId.
 select quantity,orderdate,productid ,first_value(quantity) over(partition by productid order by orderdate) as "first quantity"from orders join order_details 
 on orders.orderid=order_details.orderid;
 
 #Calculate a cumulative moving average UnitPrice for each CustomerId.
  select customerid,unitprice,avg(unitprice) over(partition by customerid order by customerid ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW )
  as "cumlative avg price" from orders join order_details on orders.orderid=order_details.orderid;
 

 









 
 


 


 