USE pharmacy;

-- DASHBOARD BUILDING
-- ORDER TABLE

SELECT (SELECT COUNT(DISTINCT sales_id) FROM sales) AS total_order,
	(SELECT ROUND(SUM(subtotal), 2) FROM sales) AS total_sales,
    (SELECT SUM(quantity)  FROM  sales) AS total_items,
    (SELECT ROUND(SUM(subtotal) / COUNT(DISTINCT sales_id), 2) FROM sales) AS average_order_value,
    dt.drugtype,
    dt.sales_by_drug_type,
    ts.top_selling_item,
    ts.total_quantity_sold
FROM
		(SELECT d.drugtype, SUM(s.quantity * d.unitprice) AS sales_by_drug_type
        FROM sales s
			JOIN drugs d ON s.drugname = d.drugname
		GROUP BY d.drugtype) AS dt
JOIN (
	SELECT d.drugname AS top_selling_item, SUM(s.quantity) AS total_quantity_sold
    FROM sales s
		JOIN drugs d ON s.drugname = d.drugname
	GROUP BY d.drugname
    ORDER BY total_quantity_sold DESC
    LIMIT 10) AS ts;
    
    
    
SELECT 
    COUNT(DISTINCT s.sales_id) AS total_orders,
    ROUND(SUM(s.subtotal), 2) AS total_sales,
    SUM(s.quantity) AS total_items,
    ROUND(SUM(s.subtotal) / COUNT(DISTINCT s.sales_id), 2) AS average_order_value,
    s.sales_date,
    dt.drugtype,
    dt.sales_by_drug_type,
    ts.top_selling_item,
    ts.total_quantity_sold
FROM 
    sales s
JOIN 
    (SELECT d.drugtype, SUM(s.quantity * d.unitprice) AS sales_by_drug_type, s.sales_date
     FROM sales s
     JOIN drugs d ON s.drugname = d.drugname
     GROUP BY d.drugtype, s.sales_date) AS dt ON s.sales_date = dt.sales_date
JOIN 
    (SELECT d.drugname AS top_selling_item, SUM(s.quantity) AS total_quantity_sold, s.sales_date
     FROM sales s
     JOIN drugs d ON s.drugname = d.drugname
     GROUP BY d.drugname, s.sales_date
     ORDER BY total_quantity_sold DESC
     LIMIT 10) AS ts ON s.sales_date = ts.sales_date
GROUP BY 
    s.sales_date, dt.drugtype, ts.top_selling_item
ORDER BY 
    s.sales_date ASC;


-- INVENTORY MANAGEMENT
-- Total Quantity by drug type 
SELECT d.drugtype, SUM(s.quantity) AS total_quantity
FROM stock s
	JOIN drugs d ON s.drug_id = d.drug_id
GROUP BY d.drugtype;

-- total value of inventory
SELECT d.drugname, d.drugtype, SUM(s.quantity * d.unitprice) AS total_value
FROM stock s
	JOIN drugs d ON s.drug_id = d.drug_id
GROUP BY d.drugname, d.drugtype;

-- Percentage of Drugs Remaining by Drug Type
SELECT d.drugtype, SUM(s.remainingstock) / SUM(s.quantity) * 100 AS percentage_remaining
FROM stock s
	JOIN drugs d ON s.drug_id = d.drug_id
GROUP BY d.drugtype
ORDER BY percentage_remaining;

-- Drug Nearing Expiry
SELECT d.drugname, s.expirydate, s.remainingstock
FROM stock s
	JOIN drugs d ON s.drug_id = d.drug_id
WHERE s.expirydate <= DATE_ADD(CURDATE(), INTERVAL 3 MONTH)
ORDER BY s.expirydate ASC;

-- Stock Replenishment Status
SELECT d.drugname, s.remainingstock, s.quantity, s.deliverydate
FROM stock s
	JOIN drugs d ON s.drug_id = d.drug_id
ORDER BY s.remainingstock ASC;

-- Top Suppliers by Quantity Supplied
SELECT sp.suppliername, SUM(s.quantity) AS total_supplied
FROM stock s
	JOIN suppliers sp ON s.stock_id = sp.supplier_id
GROUP BY sp.suppliername
ORDER BY total_supplied DESC
LIMIT 10;


SELECT COUNT(DISTINCT sales_id) AS total_orders FROM sales;
SELECT ROUND(SUM(subtotal), 2) AS total_sales FROM sales;
SELECT ROUND(SUM(subtotal) / COUNT(DISTINCT sales_id), 2) AS average_order_value FROM sales;


-- percentage of drug close to expiration
SELECT 
    ROUND(
        (COUNT(CASE WHEN DATEDIFF(expirydate, CURDATE()) <= 30 THEN 1 END) * 100.0) 
        / COUNT(*), 1
    ) AS percentage_close_to_expiration
FROM 
    stock;

SELECT 
    DATE_FORMAT(s.sales_date, '%Y-%m') AS month,   -- Format the sales_date by year and month
    ROUND(SUM((s.subtotal - (d.unitprice * s.quantity))), 2) AS total_profit,  -- Calculate total profit (Revenue - Cost)
    ROUND((SUM((s.subtotal - (d.unitprice * s.quantity))) / SUM(s.subtotal)) * 100, 2) AS profit_percentage,  -- Calculate profit percentage
    ROUND(SUM(s.subtotal), 2) AS total_revenue,   -- Total revenue (sales)
    ROUND(SUM(s.quantity * d.unitprice), 2)  AS total_cost  -- Total cost (quantity * unit cost)
FROM 
    sales s
JOIN 
    drugs d ON s.drugname = d.drugname   -- Join the sales and drugs table on the drug name or ID
GROUP BY 
    month
ORDER BY 
    month ASC;
