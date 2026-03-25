SELECT MONTHNAME(date) AS month , YEAR(date) AS year, ROUND(SUM(gp.gross_price * fm.sold_quantity) / 1000000, 2) AS gross_sales_mln
FROM gdb023.fact_sales_monthly fm
JOIN dim_customer c 
ON fm.customer_code = c.customer_code
JOIN fact_gross_price gp 
ON fm.product_code = gp.product_code AND fm.fiscal_year = gp.fiscal_year
WHERE c.customer = "Atliq Exclusive"
GROUP BY month, year
ORDER BY year, month;