use [SQL-Training]

--How many stores are in each unique state in the stores table? Select the state and
--   display the number of store  in each.
--Hint: count is used to count rows in a column,
----   sum works on numeric data only.
select state , COUNT (state) as [no.of.stores]  from stores group by state

--Select the title and price in the table title that the price is greater than 10.00. 
--Display the results in Ascending order based on the price

select title,price from Titles where price > 10.00 order by price asc

