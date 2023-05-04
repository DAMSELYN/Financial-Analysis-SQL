USE challenge_4;
-- Q1. What are the names of all the customers who live in New York?
SELECT CONCAT(FirstName," ", LastName) AS fullname
FROM customers
WHERE City = "New York";

-- Q2 What is the total number of accounts in the Accounts table?
SELECT COUNT(AccountID) as number_of_accounts
FROM accounts;

-- Q3. What is the total balance of all checking accounts?
SELECT SUM(Balance) as total_balance
FROM accounts
WHERE AccountType = "Checking";

-- Q4. What is the total balance of all accounts associated with customers who live in Los Angeles?
SELECT SUM(Balance) as total_balance
FROM accounts a
LEFT JOIN customers c
ON a.CustomerID = c.CustomerID
WHERE City = "Los Angeles";

-- Q5. Which branch has the highest average account balance?
SELECT BranchID,ROUND(AVG(Balance),2)as average_account_balance
FROM accounts a
GROUP BY BranchID
ORDER BY AVG(Balance) DESC
LIMIT 1;


-- Q6. Which customer has the highest current balance in their accounts?
SELECT c.*,Balance
FROM customers c
JOIN accounts a  
ON a.CustomerID = c.CustomerID
WHERE AccountTYPE ="Checking"
ORDER BY Balance DESC
LIMIT 1;

-- Q7. Which customer has made the most transactions in the Transactions table?
SELECT c.CustomerID,CONCAT(c.FirstName," ",c.LastName) as fullname,COUNT(TransactionID) as no_of_transactions
FROM transactions t 
JOIN accounts a 
ON t.AccountID = a.AccountID
JOIN customers c
ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID DESC
ORDER BY COUNT(TransactionID) DESC
LIMIT 1;


-- Q8 Which branch has the highest total balance across all of its accounts?
SELECT b.*, SUM(Balance) as total_balance
FROM branches b
Join accounts a
ON b. BranchID = a.BranchID
GROUP BY BranchID
ORDER BY SUM(Balance) desc
LIMIT 1;


-- Q9. Which customer has the highest total balance across all of their accounts, including savings and checking accounts?
SELECT c.CustomerID,CONCAT(c.FirstName," ",c.LastName) as fullname, sum(Balance) as total_balance
FROM customers c
INNER JOIN accounts a  
ON a.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY SUM(Balance) DESC
LIMIT 1;

-- Q10. Which branch has the highest number of transactions in the Transactions table?
SELECT b.*, count(TransactionID) as no_of_transactions
FROM branches b
INNER JOIN accounts a
ON a.BranchID = b.BranchID
JOIN transactions t
ON t.AccountID = a.AccountID
GROUP BY BranchID
ORDER BY COUNT(TransactionID) DESC
LIMIT 1;
