CodeaCamp06s-Mac-mini:Desktop codea_mac_06$ sqlite3 EssentialSQL.db
-- Loading resources from /Users/codea_mac_06/.sqliterc

SQLite version 3.8.5 2014-08-15 22:37:57
Enter ".help" for usage hints.
sqlite> .schema
CREATE TABLE Customers (
 CustomerID INTEGER PRIMARY KEY
,CompanyName VARCHAR(60)
,ContactName VARCHAR(40)
,ContactTitle VARCHAR(60)
,Address VARCHAR(60)
,City VARCHAR(60)
,State VARCHAR(2)
);
CREATE TABLE OrderDetails (
 OrderDetailID INTEGER PRIMARY KEY
,OrderID INTEGER
,ProductID INTEGER
,UnitPrice REAL
,Quantity INTEGER
);
CREATE TABLE Orders(
OrderID INTEGER PRIMARY KEY
,CustomerID INTEGER
,OrderDate VARCHAR(25)
,RequiredDate VARCHAR(25)
,ShippedDate VARCHAR(25)
);
sqlite> 

1.-
sqlite> SELECT COUNT(OrderID) AS Total FROM Orders
   ...> WHERE CustomerID = 3;
Total     
----------
6         

2.-
sqlite> SELECT COUNT(OrderID) AS Total FROM Orders
   ...> INNER JOIN Customers
   ...> ON Orders.CustomerID = Customers.CustomerID
   ...> WHERE ContactName = "Jim Wood";
Total     
----------
6         
sqlite> 

3.-
sqlite> SELECT COUNT(OrderID) AS Total FROM Orders
   ...> INNER JOIN Customers
   ...> ON Orders.CustomerID = Customers.CustomerID
   ...> WHERE CompanyName = "Slots Carpet"
   ...> ;
Total     
----------
2       

4.-
sqlite> SELECT CompanyName, COUNT(OrderID) As Total FROM Orders
   ...> INNER JOIN Customers
   ...> ON Orders.CustomerID = Customers.CustomerID
   ...> GROUP BY CompanyName
   ...> ORDER BY Total DESC ;
CompanyName  Total     
-----------  ----------
Floor Co.    6         
Sagebrush C  5         
Main Tile a  4         
Deerfield T  3         
Slots Carpe  2         
sqlite> 


5.-
sqlite> SELECT CompanyName, COUNT(OrderID) As Total FROM Orders
   ...> INNER JOIN Customers
   ...> ON Orders.CustomerID = Customers.CustomerID
   ...> GROUP BY CompanyName
   ...> ORDER BY Total ASC ;
CompanyName   Total     
------------  ----------
Slots Carpet  2         
Deerfield Ti  3         
Main Tile an  4         
Sagebrush Ca  5         
Floor Co.     6         
sqlite> 


6.- 
sqlite> SELECT CompanyName, COUNT(OrderID) AS Max FROM Orders
   ...> INNER JOIN Customers
   ...> ON Orders.CustomerID = Customers.CustomerID
   ...> GROUP BY CompanyName
   ...> ORDER BY Max DESC
   ...> LIMIT 1;
CompanyName  Max       
-----------  ----------
Floor Co.    6         
sqlite> 


7.-
sqlite> SELECT CompanyName, SUM(Quantity) AS Piezas FROM OrderDetails
   ...> INNER JOIN Orders
   ...> ON OrderDetails.OrderID = Orders.OrderID
   ...> INNER JOIN Customers
   ...> ON Orders.CustomerID = Customers.CustomerID
   ...> GROUP BY CompanyName
   ...> ORDER BY Piezas DESC;
CompanyName         Piezas    
------------------  ----------
Main Tile and Bath  940       
Sagebrush Carpet    740       
Floor Co.           670       
Deerfield Tile      340       
Slots Carpet        250       
sqlite> 


8.-
sqlite> SELECT OrderID, UnitPrice*Quantity FROM OrderDetails
   ...> WHERE OrderID = 4 ;
OrderID     UnitPrice*Quantity
----------  ------------------
4           400.0             
sqlite> 


9.-
sqlite> SELECT OrderID, SUM(UnitPrice*Quantity) FROM OrderDetails
   ...> GROUP BY OrderID;
OrderID     SUM(UnitPrice*Quantity)
----------  -----------------------
1           48.0                   
2           1948.7                 
3           2395.9                 
4           400.0                  
5           3638.6                 
6           384.5                  
7           1321.5                 
8           1941.7                 
9           300.0                  
10          133.2                  
11          421.2                  
12          32.0                   
13          250.0                  
14          881.0                  
15          1344.1                 
16          207.5                  
17          1942.6                 
18          285.5                  
19          1626.5                 
20          166.0                  
sqlite> 


10.-
sqlite> SELECT OrderID, SUM(UnitPrice*Quantity) AS total FROM OrderDetails
   ...> GROUP BY OrderID
   ...> HAVING total > 1000;
OrderID     total     
----------  ----------
2           1948.7    
3           2395.9    
5           3638.6    
7           1321.5    
8           1941.7    
15          1344.1    
17          1942.6    
19          1626.5    
sqlite> 

11.-
sqlite> SELECT OrderId, SUM(Quantity) FROM OrderDetails
   ...> GROUP BY OrderID;
OrderID     SUM(Quantity)
----------  -------------
1           90           
2           330          
3           240          
4           80           
5           380          
6           140          
7           210          
8           190          
9           60           
10          100          
11          180          
12          60           
13          50           
14          140          
15          110          
16          70           
17          200          
18          120          
19          130          
20          60           
sqlite> 


