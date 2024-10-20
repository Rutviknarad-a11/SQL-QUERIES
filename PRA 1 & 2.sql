create database ecome3;

show databases;

use ecome3;

CREATE TABLE Client_Master (
    CLIENTNO VARCHAR(6) PRIMARY KEY CHECK (CLIENTNO LIKE 'C%'), 
    NAME VARCHAR(20) NOT NULL,  
    ADDRESS1 VARCHAR(30),  
    ADDRESS2 VARCHAR(30),  
    CITY VARCHAR(15),  
    PINCODE INT(8),  
    STATE VARCHAR(15),  
    BALDUE DECIMAL(10,2) 
);

INSERT INTO Client_Master (CLIENTNO, NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BALDUE)
VALUES ('C10001', 'Rajesh Kumar', '12 MG Road', NULL, 'Mumbai', 400001, 'Maharashtra', 1500.75);

INSERT INTO Client_Master (CLIENTNO, NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BALDUE)
VALUES ('C10002', 'Anita Verma', '45 Park Street', 'Flat 7A', 'Kolkata', 700016, 'West Bengal', 2300.50);

INSERT INTO Client_Master (CLIENTNO, NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BALDUE)
VALUES ('C10003', 'Suresh Reddy', '18 Brigade Road', NULL, 'Bangalore', 560001, 'Karnataka', 780.25);

INSERT INTO Client_Master (CLIENTNO, NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BALDUE)
VALUES ('C10004', 'Priya Sharma', '22 Connaught Place', 'Office 302', 'New Delhi', 110001, 'Delhi', 920.90);

INSERT INTO Client_Master (CLIENTNO, NAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, BALDUE)
VALUES ('C10005', 'Amit Singh', '7 Gachibowli', NULL, 'Hyderabad', 500032, 'Telangana', 1340.00);

SELECT clientNO, baldue
FROM client_MASTER
WHERE baldue > 1200;

use ecome3;

CREATE TABLE Product_Master (
    PRODUCTNO VARCHAR(6) PRIMARY KEY CHECK (PRODUCTNO LIKE 'P%'), 
    DESCRIPTION VARCHAR(15) NOT NULL, 
    PROFITPERCENT DECIMAL(4,2) NOT NULL, 
    UNITMEASURE VARCHAR(10) NOT NULL, 
    QTYONHAND INT(8) NOT NULL, 
    REORDERLVL INT(8) NOT NULL, 
    SELLPRICE DECIMAL(8,2) NOT NULL CHECK (SELLPRICE > 0),  
    COSTPRICE DECIMAL(8,2) NOT NULL CHECK (COSTPRICE > 0)  
);

INSERT INTO Product_Master (PRODUCTNO, DESCRIPTION, PROFITPERCENT, UNITMEASURE, QTYONHAND, REORDERLVL, SELLPRICE, COSTPRICE)
VALUES ('P10001', 'Laptop', 15.50, 'Unit', 100, 10, 75000.00, 65000.00);

INSERT INTO Product_Master (PRODUCTNO, DESCRIPTION, PROFITPERCENT, UNITMEASURE, QTYONHAND, REORDERLVL, SELLPRICE, COSTPRICE)
VALUES ('P10002', 'Smartphone', 10.00, 'Unit', 250, 30, 40000.00, 36000.00);

INSERT INTO Product_Master (PRODUCTNO, DESCRIPTION, PROFITPERCENT, UNITMEASURE, QTYONHAND, REORDERLVL, SELLPRICE, COSTPRICE)
VALUES ('P10003', 'Headphones', 20.00, 'Pair', 150, 25, 2000.00, 1600.00);

INSERT INTO Product_Master (PRODUCTNO, DESCRIPTION, PROFITPERCENT, UNITMEASURE, QTYONHAND, REORDERLVL, SELLPRICE, COSTPRICE)
VALUES ('P10004', 'Tablet', 12.50, 'Unit', 80, 15, 30000.00, 26000.00);

INSERT INTO Product_Master (PRODUCTNO, DESCRIPTION, PROFITPERCENT, UNITMEASURE, QTYONHAND, REORDERLVL, SELLPRICE, COSTPRICE)
VALUES ('P10005', 'Smartwatch', 8.00, 'Unit', 200, 20, 15000.00, 13800.00);

UPDATE product_MASTER
SET costprice = 950.00
WHERE DESCRIPTION = 'TABLET';

use ecome3;

CREATE TABLE Salesman_Master (
    SALESMANNO VARCHAR(6) PRIMARY KEY CHECK (SALESMANNO LIKE 'S%'), 
    SALESMANNAME VARCHAR(20) NOT NULL, 
    ADDRESS1 VARCHAR(30) NOT NULL, 
    ADDRESS2 VARCHAR(30),  
    CITY VARCHAR(20), 
    PINCODE INT, 
    STATE VARCHAR(20), 
    SALAMT DECIMAL(8,2) NOT NULL CHECK (SALAMT > 0), 
    TGTTOGET DECIMAL(6,2) NOT NULL CHECK (TGTTOGET > 0), 
    YTDSALES DECIMAL(6,2) NOT NULL, 
    REMARKS VARCHAR(60)
);

INSERT INTO Salesman_Master (SALESMANNO, SALESMANNAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, SALAMT, TGTTOGET, YTDSALES, REMARKS)
VALUES ('S10001', 'Ravi Kumar', '123 Main Street', 'Apartment 4A', 'Mumbai', 400001, 'Maharashtra', 55000.00, 9000.00, 8500.00, 'Top performer of the quarter');

INSERT INTO Salesman_Master (SALESMANNO, SALESMANNAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, SALAMT, TGTTOGET, YTDSALES, REMARKS)
VALUES ('S10002', 'Meena Sharma', '45 Park Avenue', NULL, 'Delhi', 110001, 'Delhi', 62000.00, 9500.00, 8500.00, 'Achieved 80% of target');

INSERT INTO Salesman_Master (SALESMANNO, SALESMANNAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, SALAMT, TGTTOGET, YTDSALES, REMARKS)
VALUES ('S10003', 'Amit Patel', '18 Lakeview Road', 'Floor 2', 'Ahmedabad', 380015, 'Gujarat', 48000.00, 9000.00, 6700.00, 'Needs improvement in sales');

INSERT INTO Salesman_Master (SALESMANNO, SALESMANNAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, SALAMT, TGTTOGET, YTDSALES, REMARKS)
VALUES ('S10004', 'Sunita Joshi', '5 Brigade Road', NULL, 'Bangalore', 560001, 'Karnataka', 54000.00, 9200.00, 9000.00, 'Consistent sales performance');

INSERT INTO Salesman_Master (SALESMANNO, SALESMANNAME, ADDRESS1, ADDRESS2, CITY, PINCODE, STATE, SALAMT, TGTTOGET, YTDSALES, REMARKS)
VALUES ('S10005', 'Rohan Gupta', '10 MG Road', 'Suite 3B', 'Hyderabad', 500032, 'Telangana', 60000.00, 9500.00, 1200.00, 'Exceeded target by 20%');

use ecome3;

CREATE TABLE sales_Orders (
    OrderNo VARCHAR(6) PRIMARY KEY, 
    ClientNo VARCHAR(6),  
    OrderDate DATE NOT NULL,  
    DelyAddr VARCHAR(25),  
    SalesmanNo VARCHAR(6),  
    DelyType CHAR(1) DEFAULT 'F', 
    BILLYN CHAR(1),  
    DelyDate DATE,  
    OrderStatus VARCHAR(10) CHECK (OrderStatus IN ('In Process', 'Fulfilled', 'BackOrder', 'Cancelled')),  
    FOREIGN KEY (ClientNo) REFERENCES Client_Master(ClientNo),  
    FOREIGN KEY (SalesmanNo) REFERENCES Salesman_Master(SalesmanNo),
    CHECK (DelyDate >= OrderDate)  
);

INSERT INTO Sales_Orders (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10001', 'C10001', '2024-09-05', '305 Sunrise Blvd', 'S10001', 'P', 'Y', '2024-09-08', 'Cancelled');

INSERT INTO Sales_Orders (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10002', 'C10002', '2024-09-15', '202 Park Street', 'S10002', 'P', 'N', '2024-09-18', 'Fulfilled');

INSERT INTO Sales_Orders (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10003', 'C10003', '2024-09-10', '12 Lake View', 'S10003', 'F', 'Y', '2024-09-13', 'BackOrder');

INSERT INTO Sales_Orders (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10004', 'C10004', '2024-09-17', '45 Hill Top', 'S10004', 'F', 'N', '2024-09-19', 'In Process');

INSERT INTO Sales_Orders (ORDERNO, CLIENTNO, ORDERDATE, DELYADDR, SALESMANNO, DELYTYPE, BILLYN, DELYDATE, ORDERSTATUS)
VALUES ('O10005', 'C10005', '2024-09-22', '45 Hill Top', 'S10004', 'F', 'N', '2024-09-26', 'In Process');

UPDATE Sales_Orders
SET SALESMANNO = 'S10005'
WHERE ORDERNO = 'O10005' AND SALESMANNO = 'S10004';

UPDATE Sales_Orders
SET SALESMANNO = 'S10004'
WHERE CLIENTNO= 'C10004' AND SALESMANNO = 'S10005';


use ecome3;

CREATE TABLE Sales_Order_Details (
    OrderNo VARCHAR(6),  
    ProductNo VARCHAR(6), 
    QtyOrdered INT(8), 
    QtyDisp INT(8),  
    ProductRate DECIMAL(10, 2),  
    PRIMARY KEY (OrderNo, ProductNo),  
    FOREIGN KEY (OrderNo) REFERENCES Sales_Orders(OrderNo),  
    FOREIGN KEY (ProductNo) REFERENCES Product_Master(ProductNo)  
);


INSERT INTO Sales_Order_Details (ORDERNO, PRODUCTNO, QTYORDERED, QTYDISP, PRODUCTRATE)
VALUES ('O10001', 'P10001', 20, 20, 1500.00);

INSERT INTO Sales_Order_Details (ORDERNO, PRODUCTNO, QTYORDERED, QTYDISP, PRODUCTRATE)
VALUES ('O10002', 'P10002', 15, 15, 750.00);

INSERT INTO Sales_Order_Details (ORDERNO, PRODUCTNO, QTYORDERED, QTYDISP, PRODUCTRATE)
VALUES ('O10003', 'P10003', 50, 25, 1250.00);

INSERT INTO Sales_Order_Details (ORDERNO, PRODUCTNO, QTYORDERED, QTYDISP, PRODUCTRATE)
VALUES ('O10004', 'P10004', 5, 5, 2500.00);

INSERT INTO Sales_Order_Details (ORDERNO, PRODUCTNO, QTYORDERED, QTYDISP, PRODUCTRATE)
VALUES ('O10005', 'P10005', 3, 4, 2300.00);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              PRACTICLE NO 1
                                                              
                                                              
SELECT Name FROM Client_Master;            ................Q3. Find out the names of all the clients.

SELECT * FROM Client_Master             ................Q4.Retrieve the entire contents of Client_Master table

SELECT Name, City, State FROM Client_Master;        ............Q5.Retrieve the list of names, city and the state of all the clients

SELECT DESCRIPTION FROM Product_Master;       ............Q6.List the various products available from the Product_Master table

SELECT Name FROM Client_Master WHERE City = 'Mumbai';        ...........Q7.List all the clients who are located in Mumbai

SELECT SALESMANNAME FROM salesman_master WHERE  SALAMT = 54000.00;      ............Q8.Find the names of Salesman who have a salary equal to Rs. 54000.00

UPDATE clieNT_MASTER SET city = 'Bangalore' WHERE clientno = 'C10005';        .........Q9.Change the city of Client_no ‘C10005’ to ‘Banglore’

UPDATE product_MASTER SET costprice = 950.00 WHERE DESCRIPTION = 'TABLET';       ..........Q10.Change the cost price of ‘Trousers ‘ to Rs 950.00

UPDATE salesmAN_MASTER SET city = 'Pune' WHERE salesmanNO = 'S10001';       ............Q11 Change the city of the salesman to Pune.  

ALTER TABLE Client_master ADD COLUMN Telephone INT(10);           ..............Q15. Add a column called Telephone of datatype number and size 10 to Client_master table

ALTER TABLE Product_master MODIFY COLUMN sellprice DECIMAL(10,2);     .............Q16. Change the size of sell price column in Product_master table to (10,2)


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                              PRACTICLE NO 2
                                                              
                                                              
SELECT name FROM client_MASTER WHERE name LIKE '_a%';                      ..............Q2.List the names of all clients having ‘a’ as the second letter in their names

SELECT name FROM client_MASTER WHERE city LIKE 'M%';                   .................Q3.LIST THE CLIENT WHO STAY IN A CITY WHOSE FIRST LATTER 'M'

SELECT name FROM client_MASTER WHERE city IN ('Bangalore', 'Mangalore');                       ..........Q4. List all clients who stay in ‘Bangalore’ or ‘Mangalore’

SELECT clientNO, baldue FROM client_MASTER WHERE baldue > 1200;                          ............Q5.List all clients whose BalDue is greater than value 1200

SELECT * FROM Sales_OrderS WHERE MONTH(OrderDate) = 9;                                ............Q6.List all information from the Sales_Order table for orders placed in the month of June

SELECT * FROM SALES_orders WHERE clientno IN ('C10001', 'C10002');                    ............Q7.List the order information for ClientNo ‘C000001’ and ‘C00002’

SELECT  DESCRIPTION FROM product_master WHERE SellPrice > 20000.00 AND SellPrice <= 70000.00;                .........Q8List product swhose selling price is greaterthan 20000 and lessthan or equal to 70000

SELECT DESCRIPTION, SellPrice, (SellPrice * 15) AS New_Price FROM Product_MASTER WHERE SellPrice > 500;                ............Q9.
 new_price

SELECT Name, City, State FROM Client_MASTER WHERE State != 'Maharashtra';                        ............Q10 List the names, city and state of clients who are not in the state of ‘Maharashtra’

SELECT COUNT(*) AS Total_Orders FROM Sales_OrderS ;                                         ............Q11 Count the total number of orders

SELECT AVG(COSTPRICE) AS Average_COSTPRICE FROM product_master;                               ...............Q.12 .Calculate the average price of all the products

SELECT MAX(COSTPRICE) AS Max_Price, MIN(COSTPRICE) AS Min_Price FROM product_master;                    ...........Q13.Determine the maximum and minimum product prices. Rename the output as max_price andmin_price respectively      

SELECT COUNT(*) AS Product_Count FROM product_master WHERE COSTPRICE <= 1300.00;                         ..........Q14.Count the number of products having price less than or equal to 13000.00

SELECT productno FROM product_master WHERE qtyonhand > REORDERLVL;                           ............Q15.List all the products whose QtyOnHand is less than reorder level

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                            Date Manipulation Operations
                                                            
                                                            
SELECT orderNO, DAYNAME(orderdate) AS orderday FROM SALES_orders;               ..............Q1.List the order number and day on which clients placed their order.

SELECT MONTHNAME(delYdate) AS delivery_month, 
DATE_FORMAT(delYdate, '%d-%m-%Y')
AS delYdate FROM SALES_orders;                                        ....................Q2.List the month (in alphabets) and date when the orders must be delivered

SELECT DATE_FORMAT(orderdate, '%d-%M-%y') AS formatted_orderdate
FROM SALES_orders;                                                      .................Q3.List the OrderDate in the format ‘DD-Month-YY’ 

SELECT DATE_ADD(CURDATE(), INTERVAL 15 DAY) AS future_date;               ...............Q4.List the date, 15 days after today’s date

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                             PRACTICLE 3
                                                             

SELECT SOD.PRODUCTNO, P.DESCRIPTION, SUM(SOD.QTYORDERED)
FROM Product_Master P, Sales_Order_Details SOD
WHERE P.PRODUCTNO = SOD.PRODUCTNO
GROUP BY SOD.PRODUCTNO, P.DESCRIPTION;                            .................Q1.Printing the description and total quantity sold for each product.




SELECT PRODUCTNO, SUM(PRODUCTRATE) FROM SALES_ORDER_DETAILS
GROUP BY PRODUCTNO;                                              .........................Q2.Finding the value of each product sold


SELECT SOD.PRODUCTNO, P.DESCRIPTION, SUM(SOD.PRODUCTRATE)
FROM Product_Master P, Sales_Order_Details SOD
WHERE P.PRODUCTNO = SOD.PRODUCTNO
GROUP BY SOD.PRODUCTNO, P.DESCRIPTION;                            .........................Q2.Finding the value of each product sold


SELECT PRODUCTNO, SUM(QTYDISP * PRODUCTRATE) AS TotalSold
FROM Sales_Order_Details GROUP BY PRODUCTNO;                      ..............................Q2.Finding the value of each product sold
        

SELECT SO.CLIENTNO,AVG(SOD.QTYORDERED)
FROM  Sales_Order_Details SOD, Sales_OrderS SO
WHERE SO.ORDERNO=SOD.ORDERNO
GROUP BY SO.ORDERNO
HAVING SUM(SOD.PRODUCTRATE)>1000;                              .......................Q3.Calculating the average quantity sold for each client that has a maximum order value of 1000

SELECT CM.CLIENTNO,CM.CLIENTNAME,AVG(SOD.QTYORDERED)
FROM  CLIENT_MASTER C ,Sales_Order_Details SOD, Sales_OrderS SO
WHERE CM CLIENTNO=SO CLIENTNO
      SO ORDERNO=SOD ORDERNO
GROUP BY SO.ORDERNO , CM.CLIENTNO
HAVING SUM(SOD.PRODUCTRATE)>1000; 


SELECT ORDERNO
FROM Sales_Orders
WHERE BILLYN = 'Y'
AND MONTH(ORDERDATE) = 9;


SELECT ORDERNO, SUM(QTYDISP * PRODUCTRATE) AS TotalBILL
FROM Sales_Order_Details
WHERE ORDERNO IN ('O10001', 'O10003') 
GROUP BY ORDERNO;

SELECT SO.ORDERNO,SUM( QTYDISP  *  PRODUCTRATE ) AS TOTALBILL
FROM SALES_ORDER_DETAILS SOD ,Sales_OrderS SO
WHERE ORDERNO IN (
    SELECT ORDERNO
    FROM Sales_Orders
    WHERE BILLYN = 'Y' 
    AND MONTH(ORDERDATE) = 9 )
GROUP BY ORDERNO ;


SELECT SO.ORDERNO, SUM(QTYDISP * PRODUCTRATE) AS TotalBILL
FROM  Sales_Order_Details SOD, Sales_OrderS SO
WHERE SO.ORDERNO=SOD.ORDERNO
GROUP BY SO.ORDERNO ;

SELECT SO.ORDERNO, SUM(QTYDISP * PRODUCTRATE) AS TotalBILL
FROM  Sales_Order_Details SOD, Sales_OrderS SO
WHERE SO.ORDERNO=SOD.ORDERNO
GROUP BY SO.ORDERNO 
HAVING ORDERNO IN (
    SELECT ORDERNO
    FROM Sales_Orders
    WHERE BILLYN = 'Y' 
    AND MONTH(ORDERDATE) = 9 );      
    
    
SELECT MONTH(SO.ORDERDATE),SUM(SOD.PRODUCTRATE)
FROM  Sales_Order_Details SOD, Sales_Orders SO
WHERE SO.ORDERNO=SOD.ORDERNO
GROUP BY SO.ORDERDATE
HAVING MONTH(SO.ORDERDATE)=9;   ............................Q4



SELECT ORDERNO, SUM(QTYDISP * PRODUCTRATE) AS TotalBILL
FROM Sales_Order_Details
WHERE ORDERNO IN (
    SELECT ORDERNO
    FROM Sales_Orders
    WHERE BILLYN = 'Y' 
    AND MONTH(ORDERDATE) = 9
)
GROUP BY ORDERNO;


                                                                  ...................................Q4.Finding out the total of all the billed orders for the month of June.
																
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
































































SELECT P.PRODUCTNO, P.DESCRIPTION, SUM(SOD.QTYDISP) AS TotalQtyToDeliver
FROM Sales_Order_Details SOD
JOIN Sales_Orders SO ON SOD.ORDERNO = SO.ORDERNO
JOIN Product_Master P ON SOD.PRODUCTNO = P.PRODUCTNO
WHERE MONTH(SO.DELYDATE) = MONTH(CURRENT_DATE())
AND YEAR(SO.DELYDATE) = YEAR(CURRENT_DATE())
GROUP BY P.PRODUCTNO, P.DESCRIPTION
HAVING SUM(SOD.QTYDISP) > 0;                                    ..................................Q3.Finding out the products and their quantities that will have to be delivered in the current MONTH.
 

SELECT P.PRODUCTNO, P.DESCRIPTION, COUNT(SOD.ORDERNO) AS TimesSold
FROM Sales_Order_Details SOD
JOIN Product_Master P ON SOD.PRODUCTNO = P.PRODUCTNO
GROUP BY P.PRODUCTNO, P.DESCRIPTION
HAVING COUNT(SOD.ORDERNO) > 1; -- Adjust the number to define "rapidly moving"
														........................................Q4Listing the ProductNo and description of constantly sold (i.e. rapidly moving) products.




