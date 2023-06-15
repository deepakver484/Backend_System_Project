create database testdb;
use testdb;

-- creating account_user table 
create table account_user (
	user_id int primary key auto_increment,
    name varchar(20),
    address varchar(30),
    phone varchar(10),
    password varchar(10)
    );
 
 -- creating trigger for generating password
DELIMITER $$
CREATE TRIGGER generate_password_trigger
BEFORE INSERT ON account_user
FOR EACH ROW
BEGIN
    SET NEW.password = SUBSTRING(MD5(RAND()) FROM 1 FOR 10);
END$$
DELIMITER ;
 
   
-- creating another table for the transactions   
create table account_Transactions (
	Transaction_id int primary key auto_increment,
    user_id int,
    Deposit int default 0,
    Withdraw int default 0,
    balance int default 0,
    Date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES account_user(user_id)
    );
    
-- auto added row for the transactions
DELIMITER $$
CREATE TRIGGER insert_account_Transaction
AFTER INSERT ON account_user
FOR EACH ROW
BEGIN
    INSERT INTO account_Transactions (user_id)
    VALUES (NEW.user_id);
END$$
DELIMITER ;
   
-- creating another trigger to autoupdate balance as per deposit and withdrawal
DELIMITER $$
CREATE TRIGGER update_balance
BEFORE INSERT ON account_Transactions
FOR EACH ROW
BEGIN
    DECLARE account_balance INT;

    SELECT balance INTO account_balance FROM account_Transactions WHERE user_id = NEW.user_id ORDER BY Transaction_id DESC LIMIT 1;

    IF account_balance IS NULL THEN
        SET account_balance = 0;
    END IF;

    SET NEW.balance = account_balance + NEW.Deposit - NEW.Withdraw;
END$$
DELIMITER;



-- creating a procedure add user   
DELIMITER $$
CREATE procedure add_user(
	In name varchar(10),
    IN address varchar(20),
    IN phone varchar(10)
    )
BEGIN
    insert into account_user(name, address, phone)
	values ( name, address, phone);
END$$
DELIMITER ;


-- calling the add_user procedure
call add_user("deepak", 'noida', '8175963256');

        
-- creating stored procedure to alter the name of the user
DELIMITER $$
CREATE procedure update_name(
	In new_name varchar(10),
    IN id varchar(20)
    )
BEGIN
    update account_user set name = new_name where user_id = id;
END$$
DELIMITER ;


-- calling the update_name
call update_name("Harish", 2);    
    
    
-- creating stored procedure to alter the address of the user
DELIMITER $$
CREATE procedure update_address(
	In new_add varchar(10),
    IN id varchar(20)
    )
BEGIN
    update account_user set address = new_add where user_id = id;
END$$
DELIMITER ;
 
 
-- calling the update_address
call update_address("Kolkata", 1);
 
 
-- creating stored procedure to alter the phone of the user
DELIMITER $$
CREATE procedure update_phone(
	In new_phone varchar(10),
    IN id varchar(20)
    )
BEGIN
    update account_user set phone = new_phone where user_id = id;
END$$
DELIMITER ;

-- calling the update_phone
call update_phone("4561237895", 1); 


-- creating stored procedure to deposit the amount into the balance
    DELIMITER $$
CREATE procedure deposit(
	In amount int,
    IN id varchar(20)
    )
BEGIN
	Insert into account_transactions (Deposit, user_id)
    values (amount, id);
END$$
DELIMITER ;

-- calling the deposit
call deposit(1000, 1); 



-- creating stored procedure to withdraw the amount into the balance
    DELIMITER $$
CREATE procedure withdraw(
	In amount int,
    IN id varchar(20)
    )
BEGIN
    Insert into account_transactions (withdraw, user_id)
    values (amount, id);
END$$
DELIMITER ;

-- calling the withdraw
call withdraw(200, 1);


select * from account_user;
select * from account_transactions;

    

    
