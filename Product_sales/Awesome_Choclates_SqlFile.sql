show tables;
desc sales;
select * from sales;
select SaleDate,Amount,Customers from sales;
select count(*) from sales;
select * from sales limit 100;
select Amount,Customers,GeoID from `awesome chocolates`.sales;
select distinct SaleDate,amount,amount/boxes from `awesome chocolates`.sales;
select distinct SaleDate,amount,amount/boxes  'Amount Per Box' from `awesome chocolates`.sales;
select * from sales
where amount > 10000;

select * from sales
where amount > 10000 order by amount desc;

select * from sales where GeoID='G1'
order by  PID desc ,amount desc;
/*question 1
how to get sales of G1 region
  done by each person
  in desc amount order
 */
SELECT PID, SUM(Amount) AS Total_Sales
FROM sales
WHERE GeoID = 'G1'
GROUP BY PID
ORDER BY Total_Sales DESC;

select * from sales
where GeoID='G1'
order by PID desc , amount desc;

/*question 1
how to get sales done by each person on everyday
 */
SELECT SaleDate, PID, Amount
FROM sales
GROUP BY SaleDate, PID
ORDER BY SaleDate, PID;

select * from sales
where Amount>10000 AND SaleDate >='2022-01-01'
