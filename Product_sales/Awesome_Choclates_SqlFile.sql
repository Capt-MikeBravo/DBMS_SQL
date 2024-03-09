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
