-- 1. Aggregate sales metrics by geographic ID
-- Shows total sales amount, average sales amount, and total boxes sold per geoID
SELECT 
    geoID,
    SUM(amount) AS total_amount,
    AVG(amount) AS avg_amount,
    SUM(boxes) AS total_boxes
FROM sales
GROUP BY geoID;

-- 2. Aggregate sales metrics by geographic region name
-- Joins sales with geo table to show totals per region
SELECT 
    g.geo,
    SUM(s.amount) AS total_amount,
    AVG(s.amount) AS avg_amount,
    SUM(s.boxes) AS total_boxes
FROM sales s
JOIN geo g ON s.geoID = g.GeoID
GROUP BY g.geo;

-- 3. Sales totals by product category and sales team
-- Excludes blank team values and summarizes boxes and revenue
SELECT 
    pr.category,
    p.team,
    SUM(s.boxes) AS total_boxes,
    SUM(s.amount) AS total_amount
FROM sales s
JOIN people p ON p.spid = s.spid
JOIN products pr ON pr.pid = s.pid
WHERE p.team <> ''
GROUP BY pr.category, p.team
ORDER BY pr.category, p.team;

-- 4. Top 10 products by total sales amount
-- Lists the highest-grossing products in descending order
SELECT 
    pr.Product,
    SUM(s.amount) AS total_amount
FROM sales s
JOIN products pr ON pr.pid = s.pid
GROUP BY pr.Product
ORDER BY total_amount DESC
LIMIT 10;

