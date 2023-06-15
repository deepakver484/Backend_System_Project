# Banking_System

The users_account system models a basic banking system. It consists of two tables: account_user and account_Transactions. The account_user table stores user information, including user_id, username, address, phone, password. The account_Transactions table records transactions with columns for Transaction_id, user_id, Deposite, Withdraw, transaction_datetime, and balance. This system enables users to perform transactions and maintains accurate account balances.

* ### [Project_Query_File](https://github.com/DeepakVerma9/Backend_system_Project/blob/main/Account_user_System/sql_project.sql)
  
  The query file included in the banking system project contains SQL statements to create the necessary database tables and entities. It also includes the creation of three triggers and several stored procedures to facilitate different functionalities.

  The `user_account` table is created with columns such as `userid`, `name`, `address`, `phone`, and `password`. This table holds user-specific information.

  The `user_transactions` table is created with columns including `transaction id`, `user_id`, `deposit`, `withdraw`, and `balance`. This table is used to record transaction-related data.

  Three triggers are created:
  1. The `generate password` trigger generates a password for each new user in the `user_account` table automatically.

  2. The `Insert account transaction` trigger is responsible for inserting new transaction records into the `user_transactions` table whenever a new user added in to the user_account table.

  3. The `update balance` trigger updates the balance in the `user_transactions` table based on deposit and withdrawal amounts.

  Additionally, several stored procedures are created:
  1. The `add_user` procedure is used to add a new user to the `user_account` table.

  2. The `update_name` procedure updates the name of a user in the `user_account` table.

  3. The `update_address` procedure updates the address of a user in the `user_account` table.

  4. The `update_phone` procedure updates the phone number of a user in the `user_account` table.

  5. The `deposit` procedure handles the deposit functionality, updating the balance in the `user_transactions` table.

  6. The `withdraw` procedure handles the withdrawal functionality, updating the balance in the `user_transactions` table.

  This query file contains all the necessary SQL statements, triggers, and stored procedures to set up the database and perform various banking-related operations within the banking system.
