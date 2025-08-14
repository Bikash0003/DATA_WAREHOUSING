SELECT
    s.emp_num,
    e.emp_fname,
    e.emp_lname,
    s.sal_amount,
    s.sal_from
FROM
    lgsalary_history s
    INNER JOIN lgemployee e ON s.emp_num = e.emp_num
WHERE
    s.sal_from = (
        SELECT MIN(s2.sal_from)
        FROM lgsalary_history s2
        WHERE s2.emp_num = s.emp_num
    )
ORDER BY
    s.emp_num;
-- Query to display the starting salary for each employee
SELECT
    s.emp_num,
    e.emp_fname,
    e.emp_lname,
    s.sal_amount,
    s.sal_from
FROM
    lgsalary_history s
    INNER JOIN lgemployee e ON s.emp_num = e.emp_num
WHERE
    s.sal_from = (
        SELECT MIN(s2.sal_from)
        FROM lgsalary_history s2
        WHERE s2.emp_num = s.emp_num
    )
ORDER BY
    s.emp_num;
SELECT
    e.emp_num,
    e.emp_fname,
    e.emp_lname,
    s.sal_amount
FROM
    lgemployee e
    INNER JOIN lgsalary_history s ON e.emp_num = s.emp_num
WHERE
    e.dept_num = 300
    AND s.sal_end IS NULL
ORDER BY
    s.sal_amount DESC;
SELECT
    prod_sku,
    prod_descript,
    prod_price
FROM lgproduct
WHERE
    prod_price > 50;