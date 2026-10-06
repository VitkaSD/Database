/* Номер 1 */
SELECT 
c.full_name,
o.order_date
FROM customers AS c
JOIN orders o ON  c.customer_id = o.customer_id;

/* Номер 2 */
SELECT 
c.full_name
FROM customers AS c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/* Номер 3 */
SELECT
p.product_name,
oi.quantity,
oi.price_per_unit
FROM order_items as oi
FULL OUTER JOIN products p ON p.product_id = oi.product_id
WHERE oi.order_id = '1'; 

/* Номер 4 */
SELECT full_name
FROM customers
WHERE customer_id IN (
    SELECT o.customer_id
    FROM orders o
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    INNER JOIN products p ON  oi.product_id = p.product_id
    WHERE p.product_name = 'Смартфон'
);

/* Номер 5 */
SELECT product_name, price
FROM products
WHERE price > (SELECT avg(price) FROM products);

/* Номер 6 */
SELECT 
    o.order_id, 
    o.order_date
FROM Orders o
WHERE EXISTS (
    SELECT 1
    FROM Order_Items oi
    WHERE oi.order_id = o.order_id
      AND oi.price_per_unit > 100000.00
);

/* Номер 7.1 */
SELECT c.full_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id
LEFT JOIN Products p ON oi.product_id = p.product_id AND p.product_name = 'Ноутбук'
GROUP BY c.customer_id, c.full_name
HAVING COUNT(p.product_id) = 0;

/* Номер 7.2 */
SELECT full_name
FROM Customers
WHERE customer_id NOT IN (
    SELECT o.customer_id
    FROM Orders o
    INNER JOIN Order_Items oi ON o.order_id = oi.order_id
    INNER JOIN Products p ON oi.product_id = p.product_id
    WHERE p.product_name = 'Ноутбук'
      AND o.customer_id IS NOT NULL
);

/* Номер 8 */
SELECT p.product_name
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

/* Номер 9 */
SELECT 
    c.full_name,
    p.product_name,
    oi.quantity
FROM Customers c
FULL OUTER JOIN Orders o ON c.customer_id = o.customer_id
FULL OUTER JOIN Order_Items oi ON o.order_id = oi.order_id
FULL OUTER JOIN Products p ON oi.product_id = p.product_id;

/* Номер 10.1 */
SELECT DISTINCT c.full_name
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi ON o.order_id = oi.order_id
INNER JOIN (
    SELECT product_id
    FROM Products
    WHERE price = (SELECT MAX(price) FROM Products)
) max_p ON oi.product_id = max_p.product_id;

/* Номер 10.2 */
SELECT full_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    WHERE order_id IN (
        SELECT order_id
        FROM Order_Items
        WHERE product_id IN (
            SELECT product_id
            FROM Products
            WHERE price = (SELECT MAX(price) FROM Products)
        )
    )
);

/* Номер 11 */
SELECT 
    c.full_name, 
    cats.category
FROM Customers c
CROSS JOIN (
    SELECT DISTINCT category 
    FROM Products
) cats;

/* Номер 12 */
SELECT 
    c1.full_name AS new_customer,
    c2.full_name AS recommended_by
FROM Customers c1
INNER JOIN Customers c2 ON c1.recommended_by = c2.customer_id;