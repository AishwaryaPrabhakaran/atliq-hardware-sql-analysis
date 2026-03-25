With cte1 as (
SELECT c.channel, ROUND(SUM(gp.gross_price * fm.sold_quantity) / 1000000, 2) AS gross_sales_mln 
FROM gdb023.fact_sales_monthly fm JOIN fact_gross_price gp 
ON fm.product_code = gp.product_code AND fm.fiscal_year = gp.fiscal_year
JOIN dim_customer c 
ON fm.customer_code = c.customer_code 
WHERE fm.fiscal_year = 2021
GROUP BY c.channel
)
SELECT cte1.channel, cte1.gross_sales_mln, ROUND(cte1.gross_sales_mln * 100 / SUM(cte1.gross_sales_mln) OVER(), 2) AS percentage_contribution
FROM cte1
ORDER BY gross_sales_mln DESC;
