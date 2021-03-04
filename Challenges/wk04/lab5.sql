-- ***********************
-- LAB 5
-- Name: Adam Jemal
-- ID: 131017188
-- Email: ajemal1@myseneca.ca
-- ***********************

-- Q1 Solution --
-- Q1 a.
SELECT employeenumber, firstname, lastname, city, phone, postalcode
FROM offices, employees
WHERE employees.officecode = offices.officecode
  AND LOWER (offices.country) LIKE 'france';

-- Q1 b.
SELECT employeenumber, firstname, lastname, city, phone, postalcode
FROM offices INNER JOIN employees
  ON employees.officecode = offices.officecode
WHERE LOWER (offices.country) LIKE 'france';

-- Q2 Solution --
SELECT C.customernumber, C.customername, TO_CHAR(p.paymentdate,'MON DD,YYYY')paymentdate, P.amount
FROM payments P INNER JOIN customers C
  ON P.customernumber = C.customernumber
    AND LOWER(C.country) LIKE 'canada'
ORDER BY customernumber ASC;


-- Q3 Solution --
SELECT customernumber, customername
FROM customers FULL OUTER JOIN payments  USING (customernumber) 
WHERE payments.amount IS NULL AND LOWER (customers.country) LIKE 'usa'
ORDER BY customernumber DESC;

-- Q4 Solution --
-- Q4 a.
CREATE OR REPLACE VIEW vwCustomerOrder AS
SELECT C.customername, C.customernumber, O.ordernumber, O.orderdate, P.productname, OD.quantityordered, OD.priceeach
FROM customers C JOIN orders O
  ON (C.customernumber = O.customernumber)
  JOIN orderdetails OD ON (OD.ordernumber = O.ordernumber)
  JOIN products P ON (P.productcode = OD.productcode);

-- Q4 b.
SELECT *
FROM vwcustomerorder;

-- Q5 Solution --
SELECT *
FROM vwcustomerorder
WHERE customernumber=124
ORDER BY ordernumber;

SELECT OD.orderlinenumber, vw.customername, vw.customernumber, vw.orderdate, vw.ordernumber,
  vw.priceeach, vw.quantityordered, vw.productname
FROM orderdetails OD JOIN vwcustomerorder vw ON (OD.ordernumber = vw.ordernumber)
ORDER BY OD.ORDERLINENUMBER;

-- Q6 Solution --
SELECT C.customernumber, C.customername, C.phone, C.creditlimit
FROM customers C FULL OUTER JOIN orders O
  ON (C.customernumber = O.customernumber)
WHERE O.ordernumber IS NULL;


-- Q7 Solution --
CREATE OR REPLACE VIEW vwEmployeeManager AS
SELECT *
FROM employees
WHERE reportsto IS NOT NULL OR reportsto IS NULL;

SELECT *
FROM vwemployeemanager, CONCAT(vwemployeemanager.firstname, vwemployeemanager.lastname) AS managername
WHERE
;

-- Q8 Solution --
CREATE OR REPLACE VIEW vwemployeemanager AS
SELECT *
FROM employees
WHERE reportsto IS NOT NULL;

SELECT *
FROM vwemployeemanager;

-- Q9 Solution --

DROP 
  VIEW vwcustomerorder;
DROP 
  VIEW vwEmployeeManager;