Overview
This repository contains SQL scripts to create and populate a database named finance. The database includes tables for storing company information, income statements, balance sheets, cash flows, and market data. Additionally, various SQL queries are provided to perform financial analyses.

Database Schema

Tables

1.company

company_id: INT, Primary Key
company_name: VARCHAR(100)
industry_sector: VARCHAR(100)

2.income

statement_id: INT, Primary Key
company_id: INT, Foreign Key
revenue: DECIMAL(15, 2)
cost_of_goods_sold: DECIMAL(15, 2)
net_income: DECIMAL(15, 2)
preffered_dividends: DECIMAL(15, 2)
common_shares_outstanding: INT

3.balance_sheet

balance_sheet_id: INT, Primary Key
company_id: INT, Foreign Key
total_assets: DECIMAL(15, 2)
total_liability: DECIMAL(15, 2)
total_equity: INT

4.cash_flow

cash_flow_id: INT, Primary Key
company_id: INT, Foreign Key
net_cash_flow: DECIMAL(15, 2)
expenditure: INT

5.market_data

market_id: INT, Primary Key
company_id: INT, Foreign Key
stock_price: DECIMAL(15, 2)
dividends_per_share: INT

Data Insertion

The provided script includes data insertion statements for each table. The data encompasses a variety of companies across different industry sectors with financial data for revenues, costs, assets, liabilities, cash flows, stock prices, and more.

SQL Queries
Financial Metrics and Ratios

Gross Profit Margin
SELECT (revenue - cost_of_goods_sold) / revenue AS gross_profit_margin FROM income;

Debt to Equity Ratio
SELECT company_id, total_liability / total_equity AS debt_to_equity_ratio FROM balance_sheet;

Earnings Per Share
SELECT company_id, (net_income - preffered_dividends) / common_shares_outstanding AS earnings_per_share FROM income;

Positive Free Cash Flow
SELECT c.company_name, cf.net_cash_flow, cf.expenditure 
FROM company C 
JOIN cash_flow CF ON C.company_id = CF.company_id 
WHERE expenditure < net_cash_flow 
ORDER BY net_cash_flow DESC 
LIMIT 4;

Return on Assets (ROA)
SELECT income.company_id, (net_income / total_assets) AS roa 
FROM income 
JOIN balance_sheet ON income.company_id = balance_sheet.company_id;

Free Cash Flow
SELECT company_id, net_cash_flow - expenditure AS free_cash_flow FROM cash_flow;

Dividend Yield
SELECT company.company_name, (dividends_per_share / stock_price) * 100 AS dividend_yield 
FROM company 
INNER JOIN market_data ON company.company_id = market_data.company_id;

Average Net Income
SELECT company_id, AVG(net_income) AS avg_net_income FROM income GROUP BY company_id;

Average Stock Price and Dividends Per Share by Industry Sector
SELECT c.industry_sector, AVG(m.stock_price) AS avg_stock_price, AVG(m.dividends_per_share) AS avg_dividends_per_share 
FROM market_data m 
JOIN company c ON m.company_id = c.company_id 
GROUP BY c.industry_sector;

Net Income to Total Assets Ratio
SELECT income.company_id, AVG(net_income / total_assets) AS net_income_to_assets_ratio 
FROM income 
JOIN balance_sheet ON income.company_id = balance_sheet.company_id 
GROUP BY company_id;

Number of Companies in Each Industry Sector
SELECT industry_sector, COUNT(DISTINCT company_id) AS num_companies 
FROM company 
GROUP BY industry_sector;

Company with Highest Revenue
SELECT company_id, SUM(revenue) AS total_revenue 
FROM income 
GROUP BY company_id 
ORDER BY total_revenue DESC 
LIMIT 1;

Revenue Rank
SELECT company_id, net_income, RANK() OVER (ORDER BY net_income DESC) AS net_income_rank FROM income;


Miscellaneous Queries
Uppercase and Lowercase Company Names
SELECT UCASE(company_name) AS Upper_case FROM company;
SELECT LCASE(company_name) AS Lower_case FROM company;

Current Date and Time
SELECT NOW(); 
SELECT DATE(NOW());
SELECT CURDATE();
SELECT DATE_FORMAT(CURDATE(), '%d/%m/%y');

Date Difference
SELECT DATEDIFF(CURDATE(), '2024-01-18');



Usage
Create the Database and Tables:

CREATE DATABASE finance;
USE finance;
-- Run the CREATE TABLE statements

Insert Data:
-- Run the INSERT INTO statements for each table

Execute Queries:
-- Run the provided queries to get the desired financial metrics and insights

License
This project is licensed under the MIT License. See the LICENSE file for more details.

Contributing
Contributions are welcome! Please submit a pull request or open an issue for any improvements or additions.

Contact
For any questions or feedback, please contact https://www.linkedin.com/in/anjaliraj4943/
anjaliraj4943@gmail.com
