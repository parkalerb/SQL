USE sales_database;


-- 1. Rank products by total sales

WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_sales
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY
        p.product_id,
        p.product_name
)

SELECT
    product_id,
    product_name,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM product_sales
ORDER BY sales_rank;

-- 2. Rank employees by salary

SELECT
    employee_id,
    employee_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees
ORDER BY salary_rank;

-- 3. Find top 3 products per category

WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        SUM(oi.quantity * oi.unit_price) AS total_sales
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.category
),

ranked_products AS (
    SELECT
        product_id,
        product_name,
        category,
        total_sales,
        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY total_sales DESC
        ) AS category_rank
    FROM product_sales
)

SELECT
    product_id,
    product_name,
    category,
    total_sales,
    category_rank
FROM ranked_products
WHERE category_rank <= 3
ORDER BY category, category_rank;

-- 4. Compare current sale with previous sale

WITH daily_sales AS (
    SELECT
        order_date,
        SUM(oi.quantity * oi.unit_price) AS total_sales
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY order_date
)

SELECT
    order_date,
    total_sales,
    LAG(total_sales) OVER (
        ORDER BY order_date
    ) AS previous_sale,
    total_sales - LAG(total_sales) OVER (
        ORDER BY order_date
    ) AS sales_difference
FROM daily_sales
ORDER BY order_date;

-- 5. Find the next order for each customer

SELECT
    customer_id,
    order_id,
    order_date,
    LEAD(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS next_order_date
FROM orders
ORDER BY customer_id, order_date;