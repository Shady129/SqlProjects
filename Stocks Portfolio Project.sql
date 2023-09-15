--Create Table Stock
CREATE TABLE Stock(
	Id         INTEGER PRIMARY KEY,
	Ticker     NVARCHAR(30)    NOT NULL,
	FullName   NVARCHAR(30)    NOT NULL,
	TradingDay NVARCHAR(30)    NOT NULL,
	Price      SMALLMONEY      NOT NULL CHECK (Price > 0),
	Sector		NVARCHAR(30),	
	Eps			SMALLMONEY     
);


--Insert the below data into Stock table
INSERT INTO Stock (Id, Ticker, FullName, TradingDay, Price, Sector, EPS)
VALUES 
(1, 'AAPL', 'APPLE INC.', '2021-02-03', 134.99, 'Electronic Technology', 3.74),
(2, 'MSFT', 'MICROSOFT CORP.', '2021-02-03', 240.7, 'Technology Services', 6.78),
(3, 'AMZN', 'AMAZON COM INC', '2021-02-03', 3380.29, 'Retail Trade', 42.60),
(4, 'GOOGL', 'ALPHABET INC (GOOGLE) CLASS A', '2021-02-03', 2040.09, 'Technology Services', 59.26),
(5, 'FB', 'FACEBOOK INC', '2021-02-03', 264.88, 'Technology Services', 10.23),
(6, 'TSLA', 'TESLA INC', '2021-02-03', 864.75, 'Consumer Durables', 0.57),
(7, 'BABA', 'ALIBABA GROUP HOLDINGS LTD.', '2021-02-03', 264.70, 'Retail Trade', 8.63),
(8, 'V', 'VISA INC', '2021-02-03', 202.83, 'Finance', 4.85),
(9, 'PYPL', 'PAYPAL HOLDINGS INC', '2021-02-03', 251.93, 'Technology Services', 2.68),
(10, 'ORCL', 'ORACLE CORP', '2021-02-03', 62.26, 'Technology Services', 3.37),
(11, 'JNJ', 'JOHNSON & JOHNSON', '2021-02-03', 160.5, 'Health Technology', NULL), 
(12, 'CMCSA', 'COMCAST CORP', '2021-02-03', 50.47, 'Consumer Services', NULL);
--Create a query that displays all data from the Stock table
SELECT * FROM Stock;


--Create a query that displays all data from the Stock table sorted in
--ascending order by the Ticker column.

SELECT * FROM Stock
ORDER BY Ticker;

--Create a query that displays all records from the Stock
--table sorted in descending order by the Price column.

SELECT * FROM Stock
ORDER BY Price DESC;

--Create a query that displays all records from the Stock
--table sorted in descending order by the Ticker column.
SELECT * FROM Stock
ORDER BY Ticker DESC;

--Create a query that displays the columns from the Stock table (in the given order):

--Ticker

--FullName

--Price

--Sort the result by the Price column in descending order.

SELECT Ticker, FullName, Price From Stock
ORDER BY Price DESC;

--Create a query that displays the columns from the Stock table (in the given order):

--Ticker

--Price

--Sort the result by the FullName column in ascending order.

SELECT Ticker, Price From Stock
ORDER BY FullName;


--EPS means Earnings Per Share. Create a query that displays all the data
--in the table sorted in ascending order by EPS.

SELECT * FROM Stock 
ORDER BY EPS;


--Create a query that displays all the data from the Stock table sorted by
--EPS in descending order.
SELECT * FROM Stock
ORDER BY EPS DESC;


--Create a query that displays all the data from the Stock table sorted by columns:

--Ticker ascending
--Price ascending

SELECT * FROM Stock
ORDER BY Ticker, Price;

--Create a query that displays the specified columns from the Stock table:
--EPS
--Ticker
--Price
--sorted by columns accordingly:
--EPS descending

SELECT EPS, Ticker, Price FROM Stock
ORDER BY EPS DESC;

--Create a query that displays the first 5 records from the Stock table.
SELECT TOP 5 * FROM Stock


--Create a query that displays 5 records from the Stock table that have the highest price(the Price column).
--Sort the result in descending order by the Price column.
SELECT TOP 5 * FROM Stock
ORDER BY Price DESC;

--Create a query that displays the first three records in
--the Stock table that have the highest EPS 
--(earnings per share) value.
--Sort the result in descending order by the EPS column.

SELECT TOP 3 * FROM Stock
ORDER BY EPS DESC;

--Create a query that displays the following columns from the Stock table:

--Price

--FullName

--Sort the result by the Price column in descending order.
--Limit the result to the first five records.

SELECT TOP 5 Price, FullName FROM Stock
ORDER BY Price DESC;


--Create a query that skips the first three records of the Stock table
--and displays the next five records.
SELECT * FROM Stock
ORDER BY Price
OFFSET 3 ROWS 
FETCH NEXT 5 ROWS ONLY;

--Create a query that displays the following columns from the Stock table:
--Ticker
--Price
--EPS
--Sort the result by the EPS column in descending order.
--Then skip the first three records and display the next five records

SELECT Ticker, Price, EPS FROM Stock 
ORDER BY EPS DESC
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY;

--Create a query that displays the third company with the highest EPS from the Stock table.
--Use the LIMIT and OFFSET clauses for this exercise.

SELECT * FROM STOCK 
ORDER BY EPS DESC
OFFSET 2 ROWS
FETCH NEXT 1 ROW ONLY;

--Create a query that displays the second company with the lowest Price 
--from the Stock table.
SELECT * FROM Stock
ORDER BY Price 
OFFSET 0 ROW
FETCH NEXT 1 ROW ONLY;

--Create a query that displays unique values for the Sector column
--(unique sector names) from the Stock table.

SELECT DISTINCT Sector FROM Stock;

--Create a query to the FACEBOOK_details view that displays all information about 'FACEBOOK INC'
Create VIEW FACEBOOK_details AS
SELECT *  FROM Stock
WHERE FullName = 'FACEBOOK INC';
SELECT* FROM FACEBOOK_details;

--Create a query to the FACEBOOK_details view that displays all information about 'TESLA INC'
CREATE VIEW TESLA_details AS
SELECT * FROM Stock
WHERE FullName = 'TESLA INC';
SELECT * FROM TESLA_details;

--Create a query that displays the number of NULL values in the EPS column.
--Assign the alias MissingEPS to the result.
SELECT COUNT(*) AS MissingEPS FROM STOCK
WHERE EPS IS NULL;

--Create a query that displays the number of non-empty values in the EPS column.
--Assign the alias NonMissingEPS to the result.
SELECT COUNT(*) AS NonMissingEPS FROM STOCK
WHERE EPS IS NOT NULL;

--Create a query that displays the average value for the Price column. 
--Assign the alias AvgPrice to the result.
SELECT AVG(Price) AS AvgPrice FROM Stock;

--Create a query that displays the lowest and highest values for EPS in the table.
--Assign the MinEPS and MaxEPS aliases respectively.
SELECT MAX(EPS) AS MaxEPS, MIN(EPS) AS MinEPS FROM Stock;


--Create a query that displays the following columns from the Stock table:
--Id
--Ticker
--FullName
--Also add a fourth column to the result that is the number of characters in the Ticker.
--Assign the alias TickerLength to the fourth column.
SELECT Id, Ticker, FullName, LEN(Ticker) AS TickerLength
FROM Stock;


---Create a query that displays How many Ticker for each ID
SELECT id,COUNT(Ticker) AS TickerLength FROM Stock
GROUP BY id;

--Group data at the Sector level. 
--Then, calculate the number of companies for each sector
--and assign an alias NumOfStocks.
SELECT Sector, COUNT(FullName) AS NumOfStocks FROM Stock
GROUP BY Sector;

--Group data at the Sector level. Then, calculate the number of companies for each sector and assign an alias NumOfStocks.
--Sort the result by the NumOfStocks column in descending order.
SELECT Sector, COUNT(FullName) AS NumOfStocks FROM Stock
GROUP BY Sector
ORDER BY NumOfStocks DESC;


--Group data at the Sector level.
--Then find the average EPS for each sector and assign the alias AvgEPSPerSector.
--Sort the result by the AvgEPSPerSector column in descending order.

SELECT Sector ,AVG(EPS) ASAvgEPSPerSector FROM Stock
GROUP BY Sector
ORDER BY ASAvgEPSPerSector DESC;


