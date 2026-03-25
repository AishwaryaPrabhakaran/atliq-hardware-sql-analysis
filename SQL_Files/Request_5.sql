SELECT 
	m.manufacturing_cost, m.product_code, p.product, p.product_code
FROM 
	fact_manufacturing_cost m JOIN dim_product p
ON 
	m.product_code = p.product_code
WHERE m.manufacturing_cost IN (
	(SELECT MIN(m.manufacturing_cost) FROM fact_manufacturing_cost),
    (SELECT MAX(m.manufacturing_cost) FROM fact_manufacturing_cost)
)
ORDER BY 
	m.manufacturing_cost DESC