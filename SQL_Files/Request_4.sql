With Cte1 as
    ( SELECT p.segment, COUNT(DISTINCT fs.product_code) AS unique_products_2020
    FROM fact_sales_monthly fs LEFT JOIN dim_product p
    ON fs.product_code = p.product_code
    WHERE fs.fiscal_year = 2020
    GROUP BY p.segment),
    Cte2 AS
    ( SELECT p.segment, COUNT(DISTINCT fs.product_code) AS unique_products_2021
    FROM fact_sales_monthly fs LEFT JOIN dim_product p
    ON fs.product_code = p.product_code
    WHERE fs.fiscal_year = 2021
    GROUP BY p.segment)
SELECT Cte1.segment, Cte1.unique_products_2020, Cte2.unique_products_2021, ROUND((Cte2.unique_products_2021 - Cte1.unique_products_2020), 2) AS difference
FROM Cte1 JOIN Cte2
ON Cte1.segment = Cte2.segment