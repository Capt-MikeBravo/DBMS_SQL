show tables;
desc sales;
select * from sales; -- good practice to write the Table name frist and then columns
select SaleDate,Amount,Customers from sales;
select count(*) from sales;
select * from sales limit 100;
select Amount,Customers,GeoID from sales;
select distinct SaleDate,amount,amount/boxes from sales;
select distinct SaleDate,amount,amount/boxes as 'Amount Per Box' from sales;

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

/*question 2
how to get sales done by each person on everyday
 */
SELECT SaleDate, PID, Amount
FROM sales
GROUP BY SaleDate, PID
ORDER BY SaleDate, PID;

select * from sales
where Amount>10000 AND SaleDate >='2022-01-01';

select * from sales
where Amount>10000 AND SaleDate>='2022-01-01';

select SaleDate,Amount from sales
where amount > 1000 and year(SaleDate)=2022
order by amount asc;

select * from sales
where Boxes >=0 and Boxes<=50
order by boxes asc;


select * from sales
where Boxes between 0 and 50
order by boxes asc;

select SaleDate,amount,boxes,weekday(SaleDate) from sales
where weekday(SaleDate)=4;

/* USING MULTIPLE TABLES */

select * from people;

select * from people
where Team = 'Delish' or Team = 'Jucies';

select * from people
where Team in ('Delish','Jucies');

select * from people
where Salesperson like '%B%';

select * from sales;

select SaleDate,Amount ,
case
    when (amount<1000) then 'Under 1K'
    when (amount<5000) then 'Under 5k'
    when (amount<10000) then 'under 10k'
    else '10k or more'
end as 'Amount categeory'
from sales;

/* joins */

#sales data with person's name
select * from sales;
select * from people;

select SaleDate,Amount,Salesperson
from sales
join people
on sales.SPID = people.SPID;# unrefined

select s.SaleDate,s.Amount,p.Salesperson,s.SPID,p.SPID
from sales s
join people p
on p.SPID=s.SPID;

#left Join
select s.SaleDate,s.Amount,pr.Product from
sales s
left join products pr
on pr.PID=s.PID;

select p.Salesperson, s.SaleDate,s.Amount,pr.Product,p.Team from
sales s
join people p
on p.SPID=s.SPID
join products pr
on pr.PID=s.PID;#multijoin

select p.Salesperson, s.SaleDate,s.Amount,pr.Product,p.Team from
sales s
join people p
on p.SPID=s.SPID
join products pr
on pr.PID=s.PID
where s.Amount<100;

select p.Salesperson, s.SaleDate,s.Amount,pr.Product,p.Team from
sales s
join people p
on p.SPID=s.SPID
join products pr
on pr.PID=s.PID
where s.Amount<100
and p.Team='Delish';

select p.Salesperson, s.SaleDate,s.Amount,pr.Product,p.Team from
sales s
join people p
on p.SPID=s.SPID
join products pr
on pr.PID=s.PID
where s.Amount<100
and p.Team='';

select p.Salesperson, s.SaleDate,s.Amount,pr.Product,p.Team,g.geoID from
sales s
join people p
on p.SPID=s.SPID
join products pr
on pr.PID=s.PID
join geo g
on g.GeoID=s.GeoID
where s.Amount<500
and p.Team=''
and g.Geo in ('India','New Zealand'); # why geoid and geo location giving differnt result


# SELECT p.Salesperson, s.SaleDate, s.Amount, pr.Product, p.Team
# FROM sales s
# JOIN people p ON p.SPID = s.SPID
# JOIN products pr ON pr.PID = s.PID
# WHERE s.Amount < 100
# GROUP BY p.Salesperson, s.SaleDate, s.Amount, pr.Product, p.Team
# ORDER BY s.Amount;#didn't understand
#
# SELECT p.Salesperson, SUM(s.Amount) AS TotalSales
# FROM sales s
# JOIN people p ON p.SPID = s.SPID
# JOIN products pr ON pr.PID = s.PID
# where s.Amount<100 and p.Team='Delish'
# GROUP BY p.Salesperson
# ORDER BY TotalSales DESC;
#
# SELECT p.Salesperson, s.SaleDate, s.Amount, pr.Product, p.Team
# FROM sales s
# JOIN people p ON p.SPID = s.SPID
# JOIN products pr ON pr.PID = s.PID
# WHERE s.Amount < 100
#   AND p.Team = 'Delish'
#   AND p.SPID IN (
#       SELECT s.SPID
#       FROM sales s
#       WHERE s.Amount < 100
#       GROUP BY s.SPID
#       HAVING COUNT(s.SPID) > 1
#   );







