Use credit_card_project;

-- 1. Create cc_detail table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date VARCHAR(20),
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

-- 2. Load csv data into SQL

load data local infile 'D:/Data Analytics/E2E Project/Credit_Card_Dashboard/credit_card.csv'
into table cc_detail
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from cc_detail;

-- 3. Create Customer details table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

-- 2. Load csv data into SQL

load data local infile 'D:/Data Analytics/E2E Project/Credit_Card_Dashboard/customer.csv'
into table cust_detail
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

Select * from cust_detail;

-- Date Cleaning 

-- . Changing str to date fromat

UPDATE cc_detail
SET Week_Start_Date = STR_TO_DATE(Week_Start_Date, '%d-%m-%Y');

ALTER TABLE cc_detail
MODIFY COLUMN Week_Start_Date DATE;



desc cc_detail;

