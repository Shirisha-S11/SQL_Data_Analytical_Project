-- Join sales and people tables to match each sale with its salesperson

select s.saleDate,s.Amount,p.Salesperson, s.SPID, p.SPID
from sales s
Join people p ON s.SPID=p.SPID;

-- Join sales and product tables to match each product with its product name
select s.saleDate, s.amount, pr.product
from sales s
left join products pr on pr.pid=s.pid;

-- Retrieve sales under $500 for the 'Delish' team, including salesperson and product details
select s.saleDate,s.Amount,p.Salesperson, pr.product,p.team
from sales s
Join people p ON s.SPID=p.SPID
join products pr on pr.pid=s.pid
where s.Amount<500
and p.Team='Delish';

-- Retrieve sales under $500 for selected countries, including salesperson, product, team, and geographic details, ordered by sale date
select s.saleDate,s.Amount,p.Salesperson, pr.product,p.team,g.Geo
from sales s
Join people p ON s.SPID=p.SPID
join products pr on pr.pid=s.pid
join geo g on g.geoid = s.geoid
where s.amount<500
and p.Team = ''
and g.Geo in ('New Zealand','India')
order by saleDate;

