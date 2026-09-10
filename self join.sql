use sales;

select * from customers;
-- self join
select * from customers as c1
join customers as c2
on c1.customerid = c2.customerid;

-- to find customers from the same city

select c1.customername as c1_name, c2.customername as c2_name, c1.city
from customers as c1 join customers as c2
on c1.city = c2.city; 

-- eliminate duplicates
select c1.customername as c1_name, c2.customername as c2_name, c1.city
from customers as c1 join customers as c2
on c1.city = c2.city
where c1.customerid != c2.customerid;

-- windows function
select customername, sum(sales) over() from customers;

-- using group by here 
-- instead of group we have to write partition
select customername , city, sum(sales) over(partition by city) as total_sales from customers;

-- row function
select customername, sales, row_number() over() as row_num from customers;

-- what if we want highest sales first
select customername, sales, row_number() over(order by sales desc) as row_num from customers;

-- rank() gives same rank to rows with the same value

select customername, sales, rank() over(order by sales desc) as sales_rank from customers;

-- dense rank
select customername, sales, dense_rank() over(order by sales desc) as sales_rank from customers;



