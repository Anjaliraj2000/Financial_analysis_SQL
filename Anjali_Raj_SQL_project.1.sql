CREATE DATABASE finance;
USE finance;
CREATE TABLE company(company_id INT PRIMARY KEY,company_name VARCHAR(100),industry_sector VARCHAR(100));
INSERT INTO company(company_id,company_name,industry_sector)VALUES
(1,'Global_Finance_Group','Finance'),
(2,'Tech_Innovator_Ldt','Technology'),
(3,'Fashion_Hub','Retail'),
(4,'Health_Solutions','Health'),
(5,'Green_Energy','Energy'),
(6,'Food_Trends','Food_and_Beverages'),
(7,'Transport_Ltd','Transportation'),
(8,'Logistics_pvt','Logistics'),
(9,'Media_dynamics','Entertainment'),
(10,'Gourmet_Delights_Co','Food_and_Beverage'),
(11,'Luxury_Auto_Makers','Automotive'),
(12,'Education_Innovators','Education'),
(13,'Home_Decor_Emporium','Retail'),
(14,'Advanced_Robotics_Solutions','Technology');
SELECT *FROM company;
UPDATE company SET industry_sector ='Healthcare' WHERE company_id = 4 ;
UPDATE company SET industry_sector ='Food_and_Beverage' WHERE company_id =6;
CREATE TABLE income(statement_id INT PRIMARY KEY,company_id INT,revenue DECIMAL(15, 2),cost_of_goods_sold DECIMAL(15, 2),net_income DECIMAL(15, 2),preffered_dividends DECIMAL(15, 2),common_shares_outstanding INT, CONSTRAINT i_foreignkey FOREIGN KEY (company_id) REFERENCES company(company_id) ON DELETE SET NULL);
INSERT INTO income(statement_id,company_id,revenue,cost_of_goods_sold,net_income,preffered_dividends,common_shares_outstanding)VALUES
(15, 1, 5000000.00, 3000000.00, 1500000.00, 20000.00, 100000),
(16, 2, 8000000.00, 4500000.00, 3200000.00, 30000.00, 150000),
(17, 3, 3500000.00, 2000000.00, 1200000.00, 15000.00, 80000),
(18, 4, 6500000.00, 4000000.00, 2200000.00, 25000.00, 120000),
(19, 5, 9000000.00, 5500000.00, 4000000.00, 35000.00, 180000),
(20, 6, 4200000.00, 2500000.00, 1500000.00, 18000.00, 90000),
(21, 7, 7500000.00, 4800000.00, 2800000.00, 30000.00, 160000),
(22, 8, 5800000.00, 3500000.00, 2000000.00, 22000.00, 110000),
(23, 9, 3200000.00, 1800000.00, 1300000.00, 12000.00, 60000),
(24, 10, 8800000.00, 5200000.00, 3600000.00, 40000.00, 200000),
(25, 11, 7200000.00, 4200000.00, 2800000.00, 32000.00, 160000),
(26, 12, 5000000.00, 2800000.00, 1700000.00, 18000.00, 90000),
(27, 13, 9800000.00, 6000000.00, 3800000.00, 45000.00, 220000),
(28, 14, 6200000.00, 3800000.00, 2400000.00, 28000.00, 140000);
SELECT *FROM income;
CREATE TABLE balance_sheet(balance_sheet_id INT PRIMARY KEY,company_id INT,total_assets DECIMAL(15,2),total_liability DECIMAL(15,2),total_equity INT, CONSTRAINT f_foreignkey FOREIGN KEY (company_id) REFERENCES company(company_id) ON DELETE SET NULL);
INSERT INTO balance_sheet(balance_sheet_id,company_id,total_assets,total_liability,total_equity)VALUES
(29, 1, 10000000.00, 6000000.00, 4000000.00),
(30, 2, 15000000.00, 9000000.00, 6000000),
(31, 3, 7000000.00, 4000000.00, 3000000),
(32, 4, 12000000.00, 8000000.00, 4000000),
(33, 5, 18000000.00, 12000000.00, 6000000),
(34, 6, 9000000.00, 6000000.00, 3000000),
(35, 7, 16000000.00, 10000000.00, 6000000),
(36, 8, 11000000.00, 7000000.00, 4000000),
(37, 9, 6000000.00, 4000000.00, 2000000),
(38, 10, 20000000.00, 12000000.00, 8000000),
(39, 11, 14000000.00, 9000000.00, 5000000),
(40, 12, 9000000.00, 6000000.00, 3000000),
(41, 13, 22000000.00, 16000000.00, 6000000),
(42, 14, 12000000.00, 8000000.00, 4000000);
SELECT *FROM balance_sheet;
CREATE TABLE cash_flow(cash_flow_id INT PRIMARY KEY ,company_id INT ,net_cash_flow DECIMAL(15,2),expenditure INT, CONSTRAINT l_foreignkey FOREIGN KEY(company_id) REFERENCES company(company_id) ON DELETE SET NULL);
INSERT INTO cash_flow(cash_flow_id,company_id,net_cash_flow,expenditure)VALUES
(43, 1, 2000000.00, 500000),
(44, 2, 3500000.00, 800000),
(45, 3, 1500000.00, 300000),
(46, 4, 2800000.00, 600000),
(47, 5, 4000000.00, 900000),
(48, 6, 1800000.00, 400000),
(49, 7, 3000000.00, 700000),
(50, 8, 2200000.00, 500000),
(51, 9, 1200000.00, 200000),
(52, 10, 3600000.00, 1000000),
(53, 11, 2800000.00, 600000),
(54, 12, 1700000.00, 400000),
(55, 13, 4500000.00, 1200000),
(56, 14, 2400000.00, 500000);
SELECT *FROM cash_flow;
CREATE TABLE market_data(market_id INT PRIMARY KEY,company_id INT,stock_price DECIMAL(15, 2),dividends_per_share INT,CONSTRAINT m_foreignkey FOREIGN KEY (company_id) REFERENCES company(company_id));
INSERT INTO market_data(market_id,company_id,stock_price,dividends_per_share)VALUES
(60,1,50.25,2),
(61,2,75.60,1),
(62,3,30.80,2),
(63,4,110.45,4),
(64,5,45.75,2),
(65,6,92.30,3),
(66,7,65.20,5),
(67,8,80.15,1),
(68,9,55.50,7),
(69,10,120.75,2),
(71,11,40.60,1),
(72,12,95.90,3),
(73,13,70.25,2),
(74,14,85.40,4);
SELECT *FROM market_data;

-- calculate gross profit margin
SELECT(revenue-cost_of_goods_sold)/revenue as gross_profit_margin FROM income;
-- debt to equity ratio
SELECT company_id,total_liability/total_equity AS debt_to_equity_ratio FROM balance_sheet;
-- earnings per share
SELECT company_id,(net_income-preffered_dividends)/common_shares_outstanding AS earnings_per_share FROM income;
-- positive free cash flow
SELECT c.company_name,cf.net_cash_flow,cf.expenditure FROM company C JOIN cash_flow CF ON C.company_id = CF.company_id WHERE expenditure < net_cash_flow order by net_cash_flow desc limit 4;
-- calculate_returns_on_assets
SELECT income.company_id,(net_income/ total_assets) AS roa FROM income JOIN balance_sheet ON income.company_id = balance_sheet.company_id;
-- free cash flow
SELECT company_id,net_cash_flow - expenditure AS free_cash_flow FROM cash_flow;
-- calculate dividend yeild
SELECT company.company_name,(dividends_per_share / stock_price) * 100 AS dividend_yield FROM company inner JOIN market_data ON company.company_id=market_data.company_id;
-- average income of each company
SELECT company_id, AVG(net_income) as avg_net_income FROM income GROUP BY company_id;
-- average stock price and dividends per share for each industry sector
SELECT c.industry_sector, AVG(m.stock_price) as avg_stock_price, AVG(m.dividends_per_share) as avg_dividends_per_share FROM market_data m JOIN company c ON m.company_id = c.company_id GROUP BY c.industry_sector;
-- Net Income to Total Assets Ratio:
SELECT income.company_id, AVG(net_income / total_assets) AS net_income_to_assets_ratio FROM income JOIN balance_sheet ON income.company_id = balance_sheet.company_id GROUP BY company_id;
-- number of companies in each industry sector
SELECT industry_sector, COUNT(DISTINCT company_id) AS num_companies FROM company GROUP BY industry_sector;
-- company with highest revenue
SELECT company_id, SUM(revenue) AS total_revenue FROM income GROUP BY company_id ORDER BY total_revenue DESC LIMIT 1;
-- revenue rank
SELECT company_id,net_income,RANK() OVER (ORDER BY net_income DESC) AS net_income_rank FROM income;

-- uppercase and lowercase
SELECT ucase(company_name) AS Upper_case FROM company;
SELECT Lcase(company_name) AS Lower_case from company;

SELECT now(); # to get date n time
SELECT Date(now()); # to get only date
SELECT curdate(); # to get approximate current date when there are many dates
SELECT date_format(curdate(),'%d/%m/%y'); # to get desired date format
SELECT datediff(curdate(),'2024-01-18'); # to get number of days




 