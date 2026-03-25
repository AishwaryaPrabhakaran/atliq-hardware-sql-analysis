With cte1 AS (
SELECT 
	p.product, p.division, p.product_code, SUM(fm.sold_quantity) AS total_sold_quantity, 
	RANK() OVER(PARTITION BY division ORDER BY SUM(fm.sold_quantity) DESC) AS rank_order 
FROM gdb023.fact_sales_monthly fm JOIN dim_product p 
ON fm.product_code = p.product_code
WHERE fm.fiscal_year = 2021
GROUP BY p.division,p.product,p.product_code
)
SELECT * FROM cte1
WHERE rank_order <= 3
ORDER BY division, rank_order;