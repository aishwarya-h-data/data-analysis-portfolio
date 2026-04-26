-- ================================================
-- SUPERSTORE SALES ANALYSIS — SQL QUERIES
-- ================================================

USE superstore_db;

-- ------------------------------------------------
-- Q1: Total Sales, Profit and Orders
-- ------------------------------------------------
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100, 2) AS Profit_Margin_Pct,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM superstore;

-- ------------------------------------------------
-- Q2: Yearly Sales and Profit Trend
-- ------------------------------------------------
SELECT 
    Year,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100, 2) AS Profit_Margin_Pct
FROM superstore
GROUP BY Year
ORDER BY Year;

-- ------------------------------------------------
-- Q3: Sales and Profit by Category
-- ------------------------------------------------
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100, 2) AS Profit_Margin_Pct
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- ------------------------------------------------
-- Q4: Sales and Profit by Region
-- ------------------------------------------------
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100, 2) AS Profit_Margin_Pct
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- ------------------------------------------------
-- Q5: Top 10 Products by Sales
-- ------------------------------------------------
SELECT 
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- ------------------------------------------------
-- Q6: Bottom 10 Products by Profit (Loss Making)
-- ------------------------------------------------
SELECT 
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit ASC
LIMIT 10;

-- ------------------------------------------------
-- Q7: Customer Segment Analysis
-- ------------------------------------------------
SELECT 
    Segment,
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100, 2) AS Profit_Margin_Pct
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- ------------------------------------------------
-- Q8: Impact of Discounts on Profit
-- ------------------------------------------------
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low (0-20%)'
        WHEN Discount <= 0.4 THEN 'Medium (21-40%)'
        WHEN Discount <= 0.6 THEN 'High (41-60%)'
        ELSE 'Very High (60%+)'
    END AS Discount_Level,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Discount_Level
ORDER BY Avg_Profit DESC;

-- ------------------------------------------------
-- Q9: Top 10 Customers by Sales
-- ------------------------------------------------
SELECT 
    `Customer Name`,
    Segment,
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM superstore
GROUP BY `Customer Name`, Segment, Region
ORDER BY Total_Sales DESC
LIMIT 10;

-- ------------------------------------------------
-- Q10: Sub-Category Performance
-- ------------------------------------------------
SELECT 
    Category,
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit)/SUM(Sales))*100, 2) AS Profit_Margin_Pct
FROM superstore
GROUP BY Category, `Sub-Category`
ORDER BY Total_Profit ASC;