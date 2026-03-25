SELECT 
	fp.customer_code, c.customer, ROUND(AVG(fp.pre_invoice_discount_pct),2) AS average_discount_percentage  
FROM 
	fact_pre_invoice_deductions fp 
JOIN 
	dim_customer c 
ON 
	fp.customer_code = c.customer_code
WHERE 
	c.market = "India"
    AND fp.fiscal_year = 2021
GROUP By 
	fp.customer_code, c.customer
ORDER BY 
	average_discount_percentage desc
LIMIT 5 ;