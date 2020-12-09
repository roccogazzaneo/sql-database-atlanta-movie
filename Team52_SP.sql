
#================================  Introduction to Database Systems ================================
#================================ 2019/11/28 - Georgia Institute of Technology ================================

#================================ FUNCTIONS ================================

### test_ccnum (compute credit card numbers per customer)

DROP FUNCTION IF EXISTS test_ccnum;
DELIMITER $$
CREATE FUNCTION test_ccnum (i_username VARCHAR(50))
RETURNS CHAR(1)
DETERMINISTIC
BEGIN
DECLARE conteggio INT;
SET conteggio = (select count(*) from users as u join creditcard as c on u.username = c.username group by u.username having u.username = i_username);
IF conteggio IS NULL THEN SET conteggio = 0; END IF;
RETURN conteggio;
END$$
DELIMITER ;

### n_theaters: compute number of theaters per company

DROP FUNCTION IF EXISTS n_theaters;
DELIMITER $$
CREATE FUNCTION n_theaters (i_compname VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE conteggio INT;
SET conteggio = (select count(theater_name) from theater group by compname having compname = i_compname);
IF conteggio IS NULL THEN SET conteggio = 0; END IF;
RETURN conteggio;
END$$
DELIMITER ;

### city_cov compute the distinct number of city covered by a company

DROP FUNCTION IF EXISTS city_cov;
DELIMITER $$
CREATE FUNCTION city_cov(i_compname VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE conteggio INT;
SET conteggio = (select count(distinct city) from theater group by compname having compname = i_compname);
IF conteggio IS NULL THEN SET conteggio = 0; END IF;
RETURN conteggio;
END$$
DELIMITER ; 

### n_employee : compute number of employees for each company

DROP FUNCTION IF EXISTS n_employee;
DELIMITER $$
CREATE FUNCTION n_employee (i_compname VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE conteggio INT;
SET conteggio = (select count(*) from manager group by company having company = i_compname);
IF conteggio IS NULL THEN SET conteggio = 0; END IF;
RETURN conteggio;
END$$
DELIMITER ;

### isAdmin_type: returns 1 if the user is an admin

DROP FUNCTION IF EXISTS isAdmin_type;
DELIMITER $$
CREATE FUNCTION isAdmin_type (i_username VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE isAdmin INT DEFAULT 0;
IF i_username in (select username from admin)
	THEN SET isAdmin = 1;
END IF;
RETURN isAdmin;
END$$
DELIMITER ;

### isCustomer_type: return 1 if the user is a customer

DROP FUNCTION IF EXISTS isCustomer_type;
DELIMITER $$
CREATE FUNCTION isCustomer_type (i_username VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE isCustomer INT DEFAULT 0;
IF i_username in (select u.username from customer as c join users as u on c.username = u.username)
	THEN SET isCustomer = 1;
END IF;
RETURN isCustomer;
END$$
DELIMITER ;

### isManager_type : return 1 if the user is a manager

DROP FUNCTION IF EXISTS isManager_type;
DELIMITER $$
CREATE FUNCTION isManager_type (i_username VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE isManager INT DEFAULT 0;
IF i_username in (select u.username from manager as m join users as u on m.username = u.username )
	THEN SET isManager = 1;
END IF;
RETURN isManager;
END$$
DELIMITER ;

### test_usertype: return the type of user

DROP FUNCTION IF EXISTS test_usertype;
DELIMITER $$
CREATE FUNCTION test_usertype(i_username VARCHAR(50)) 
RETURNS varchar(20) 
DETERMINISTIC
BEGIN
DECLARE user_type VARCHAR(20);
IF i_username IN (select c.username from customer as c join manager as m on c.username = m.username)
	THEN SET user_type = 'CustomerManager';
ELSEIF i_username in (select c.username from customer as c join admin as a on c.username = a.username)
	THEN SET user_type = 'CustomerAdmin';
ELSEIF i_username in (select u.username from manager as m join users as u on m.username = u.username )
	THEN SET user_type = 'Manager';
ELSEIF i_username in (select u.username from customer as c join users as u on c.username = u.username)
	THEN SET  user_type = 'Customer';
ELSEIF i_username in (select * from admin)
	THEN SET user_type = 'Admin';
ELSE 
	SET user_type = 'User';
END IF;
RETURN user_type;
END$$
DELIMITER ;

### fname_lname_mgr (EXTRA- can be used to easily concatenate fname and lname of a manager)

DROP FUNCTION IF EXISTS fname_lname_mgr;
DELIMITER $$
CREATE FUNCTION fname_lname_mgr (i_username VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
DECLARE complete_name VARCHAR(50);
SET complete_name = (select CONCAT(firstname,' ', lastname) from users where username = i_username);
RETURN complete_name;
END$$
DELIMITER ;


### TABLES CHANGE

#Just hasing the password that we have been given.
#update users set user_password = MD5(user_password);

#================================  VIEWS ================================ 

#### adminmanagecompany: create a table with the derived attribute for each company

DROP VIEW IF EXISTS adminmanagecompany;
CREATE VIEW adminmanagecompany AS
    SELECT 
        `company`.`company_name` AS `company_name`,
        CITY_COV(`company`.`company_name`) AS `n_CityCovered`,
        N_THEATERS(`company`.`company_name`) AS `n_Theaters`,
        N_EMPLOYEE(`company`.`company_name`) AS `n_Employee`
    FROM
        company;

### adminmanageuser: username with the total number of creditcard he has plus its complete usertype

DROP VIEW IF EXISTS adminmanageuser;
CREATE VIEW adminmanageuser AS
    SELECT 
        `users`.`username` AS `username`,
        TEST_CCNUM(`users`.`username`) AS `n_cc`,
        TEST_USERTYPE(`users`.`username`) AS `user_type`,
        `users`.`user_status` AS `user_status`
    FROM
        users;

### available_managers: create a table composed of only available managers, those that have not been assigned a theater yet.
DROP VIEW IF EXISTS available_managers;
CREATE VIEW available_managers AS
    SELECT 
        `manager`.`username` AS `username`,
        `manager`.`zipcode` AS `zipcode`,
        `manager`.`street` AS `street`,
        `manager`.`city` AS `city`,
        `manager`.`state` AS `state`,
        `manager`.`company` AS `company`
    FROM
        manager
    WHERE
        manager.`username` IN (SELECT 
                `manager`.`username`
            FROM
                (`manager`
                JOIN `theater` ON ((`manager`.`username` = `theater`.`username_mgr`))))
            IS FALSE;

### userlogin_view: Create a view with binary values for iscustomer, isadmin and ismanager

DROP VIEW IF EXISTS userlogin_view;
CREATE VIEW `userlogin_view` AS
    SELECT 
        `users`.`username` AS `username`,
        `users`.`user_status` AS `status`,
        ISCUSTOMER_TYPE(`users`.`username`) AS `isCustomer`,
        ISADMIN_TYPE(`users`.`username`) AS `isAdmin`,
        ISMANAGER_TYPE(`users`.`username`) AS `isManager`
    FROM
        users;
        



#================================  STORED PROCEDURES ================================


###SCREEN 1 user_login

DROP PROCEDURE IF EXISTS user_login;
DELIMITER $$
CREATE PROCEDURE user_login(IN i_username VARCHAR(50) , IN i_password VARCHAR(50))
BEGIN
IF i_username not in (select username from users) OR MD5(i_password) not in (select user_password from users where username = i_username) 
or (select user_status from users where username = i_username) not in ('Approved') THEN 
DROP TABLE IF EXISTS UserLogin;
CREATE TABLE UserLogin
SELECT username, status, isCustomer , isAdmin , isManager
from userlogin_view
where 0;
ELSE
DROP TABLE IF EXISTS UserLogin;
CREATE TABLE UserLogin
SELECT username, status, isCustomer , isAdmin , isManager
from userlogin_view
where username = i_username;
END IF;
END$$
DELIMITER ;

### SCREEN 3 user_register 

DROP PROCEDURE IF EXISTS user_register;
DELIMITER $$
CREATE PROCEDURE user_register(IN i_username VARCHAR(50) , In i_password VARCHAR(50) ,
IN i_firstname VARCHAR(50) , IN i_lastname VARCHAR(50))
BEGIN
if length(i_password)<8
then
select('password min lenght must be 8');
else
INSERT INTO users (username, user_status, user_password , firstname, lastname)
VALUES (i_username, 'Pending' , MD5(i_password) , i_firstname, i_lastname);
end if;
END$$
DELIMITER ;

### SCREEN 4a customer_only_register

DROP PROCEDURE IF EXISTS customer_only_register;
DELIMITER $$
CREATE PROCEDURE customer_only_register( IN i_username VARCHAR(50) , IN i_password VARCHAR(50) ,IN i_firstname VARCHAR(50) , IN i_lastname VARCHAR(50))
BEGIN
	if length(i_password)<8
	then
	select('password min lenght must be 8');
	else
	INSERT INTO users VALUES (i_username, 'Pending', MD5(i_password), i_firstname, i_lastname);
	INSERT INTO customer VALUES (i_username);
    end if;
END$$
DELIMITER ;

### SCREEN 4b customer_add_creditcard
DROP PROCEDURE IF EXISTS customer_add_creditcard;
DELIMITER $$
CREATE PROCEDURE customer_add_creditcard(IN i_username VARCHAR(50) , i_creditCardNum CHAR(16))
BEGIN
	IF (select count(*) from creditcard where username = i_username) = 5 or length(i_creditCardNum) <> 16 THEN SELECT ('Error: Credit cards cannot be more than five or Credit Card length is different than 16');
    ELSE
	INSERT INTO creditcard VALUES (i_username, i_creditCardNum);
    END IF;
END$$
DELIMITER ;

### SCREEN 5 manager_only_register

DROP PROCEDURE IF EXISTS manager_only_register;
DELIMITER $$
CREATE PROCEDURE manager_only_register(i_username VARCHAR(50) , i_password VARCHAR(50), i_firstname VARCHAR(50), i_lastname VARCHAR(50), i_comName VARCHAR(50), i_empStreet VARCHAR(50), i_empCity VARCHAR(50), i_empState CHAR(2), i_empZipcode CHAR(5))
BEGIN
	IF i_username IN (select * from employee) OR (i_empZipcode, i_empStreet, i_empCity, i_empState) IN (SELECT zipcode, street, city, state FROM manager) OR i_comName NOT IN (SELECT * FROM company)
    or length(i_password)<8
    THEN SELECT ('ERROR');
    ELSE
		INSERT INTO users VALUES (i_username, 'Pending', MD5(i_password), i_firstname, i_lastname);
		INSERT INTO employee VALUES (i_username);
		INSERT INTO manager VALUES (i_username, i_empZipcode, i_empStreet, i_empCity, i_empState, i_comName);
	END IF;
END$$
DELIMITER ;

### SCREEN 6a manager_customer_register 

DROP PROCEDURE IF EXISTS manager_customer_register ;
DELIMITER $$
CREATE PROCEDURE manager_customer_register(IN i_username VARCHAR(50), IN i_password VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), 
IN i_empCity VARCHAR(50), IN i_empState CHAR(2), IN i_empZipcode CHAR(5))
BEGIN 
    IF (i_empZipcode, i_empStreet, i_empCity, i_empState) IN (SELECT zipcode, street, city, state FROM manager) OR i_comName NOT IN (SELECT * FROM company)
    or length(i_password) <8 THEN SELECT ('ERROR');
    ELSE
		INSERT INTO users VALUES (i_username, 'Pending', MD5(i_password), i_firstname, i_lastname);
		INSERT INTO employee VALUES (i_username);
        INSERT INTO customer VALUES (i_username);
		INSERT INTO manager VALUES (i_username, i_empZipcode, i_empStreet, i_empCity, i_empState, i_comName);
	END IF;
END$$
DELIMITER ;

### SCREEN 6b manager_customer_add_creditcard

DROP PROCEDURE IF EXISTS manager_customer_add_creditcard;
DELIMITER $$
CREATE PROCEDURE manager_customer_add_creditcard(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(16))
BEGIN 
	if length (i_creditCardNum)<>16
    then select ('error: creadit cards have 16 numbers');
    else
	INSERT INTO creditcard VALUES (i_username, i_creditCardNum);
    end if;
END$$
DELIMITER ;


### SCREEN 13a admin_approve_user 

DROP PROCEDURE IF EXISTS admin_approve_user;
DELIMITER $$
CREATE PROCEDURE admin_approve_user(IN i_username VARCHAR(50))
BEGIN 
	UPDATE users SET user_status = 'Approved' WHERE username = i_username;
END$$
DELIMITER ;

### SCREEN 13b admin_decline_user 

DROP PROCEDURE IF EXISTS admin_decline_user;
DELIMITER $$
CREATE PROCEDURE admin_decline_user(IN i_username VARCHAR(50))
BEGIN 
IF i_username in (select username from users where user_status = 'Approved') THEN SELECT ('User cannot be declined');
ELSE
	UPDATE users SET user_status = 'Declined' WHERE username = i_username;
END IF;
END$$
DELIMITER ;


### SCREEN 13c admin_filter_user

DROP PROCEDURE admin_filter_user;
DELIMITER $$
CREATE PROCEDURE admin_filter_user(i_username VARCHAR(50), i_status VARCHAR(50), i_sortBy VARCHAR(50), i_sortDirection VARCHAR(50))
BEGIN 
	IF i_sortDirection = '' THEN SET i_sortDirection = 'DESC'; END IF;
    IF i_sortBy = '' THEN SET i_sortby = 'username'; END IF;
    IF i_status NOT IN ('Approved', 'Declined', 'Pending', 'ALL') OR i_sortDirection NOT IN ('ASC', 'DESC') OR i_sortBy NOT IN ('username', 'creditCardCount', 'userType', 'status')
	THEN SELECT ('ERROR'); 
    ELSE 
		IF i_sortDirection = 'DESC' THEN 
        DROP TABLE IF EXISTS AdFilterUser;
        CREATE TABLE AdFilterUser
        SELECT username, n_cc as 'creditCardCount' , user_type as 'userType' , user_status as 'status'
		FROM adminmanageuser 
		WHERE (user_status = i_status OR i_status = 'ALL') AND (username = i_username OR i_username = '')
		ORDER BY (CASE i_sortby
        WHEN 'username' THEN username
        WHEN 'creditCardCount' THEN n_cc
        WHEN 'userType' THEN user_type
        WHEN 'status' THEN user_status END) DESC;
        ELSE 
			DROP TABLE IF EXISTS AdFilterUser;
			CREATE TABLE AdFilterUser
			SELECT username, n_cc as 'creditCardCount' , user_type as 'userType' , user_status as 'status'
			FROM adminmanageuser 
			WHERE (user_status = i_status OR i_status = 'ALL') AND (username = i_username OR i_username = '')
			ORDER BY (CASE i_sortby
			WHEN 'username' THEN username
			WHEN 'creditCardCount' THEN n_cc
			WHEN 'userType' THEN user_type
			WHEN 'status' THEN user_status END) ASC;
            END IF;
    END IF;
END$$
DELIMITER ;

###SCREEN 14 admin_filter_company

DROP PROCEDURE IF EXISTS admin_filter_company;
DELIMITER $$
CREATE  PROCEDURE admin_filter_company(i_comName VARCHAR(50), i_minCity INT, i_maxCity INT , i_minTheater INT, i_maxTheater INT, i_minEmployee INT, i_maxEmployee INT, i_sortBy VARCHAR(50), i_sortDirection VARCHAR(50))
BEGIN 
	IF i_minCity IS NULL THEN SET i_minCity = -1; END IF;
    IF i_maxCity IS NULL THEN SET i_maxCity = 1000; END IF;
    IF i_minTheater IS NULL THEN SET i_minTheater = -1; END IF;
    IF i_maxTheater IS NULL THEN SET i_maxTheater = 100000; END IF;
    IF i_minEmployee IS NULL THEN SET i_minEmployee = -1; END IF;
    IF i_maxEmployee IS NULL THEN SET i_maxEmployee = 100000; END IF;
	IF i_sortDirection = '' THEN SET i_sortDirection = 'DESC'; END IF;
    IF i_sortBy = '' THEN SET i_sortby = 'comName'; END IF;
    IF i_sortDirection NOT IN ('ASC', 'DESC') OR i_sortBy NOT IN ('comName', 'numCityCover', 'numTheater', 'numEmployee')
	THEN SELECT ('ERROR'); 
    ELSE 
		IF i_sortDirection = 'DESC' THEN 
			IF (i_comName = 'ALL' OR i_comName = '') THEN
				DROP TABLE IF EXISTS AdFilterCom;
				CREATE TABLE AdFilterCom
				SELECT company_name as 'comName' , n_CityCovered as 'numCityCover' , n_Theaters as 'numTheater' , n_Employee as 'numEmployee'
				FROM adminmanagecompany
				WHERE (n_CityCovered BETWEEN i_minCity AND i_maxCity) AND (n_Theaters BETWEEN i_minTheater AND i_maxTheater) AND (n_Employee BETWEEN i_minEmployee AND i_maxEmployee)
				ORDER BY (CASE i_sortby
				WHEN 'comName' THEN company_name
				WHEN 'numCityCover' THEN n_CityCovered
				WHEN 'numTheater' THEN n_Theaters
				WHEN 'numEmployee' THEN n_Employee END) DESC;
			ELSE
				DROP TABLE IF EXISTS AdFilterCom;
				CREATE TABLE AdFilterCom
				SELECT company_name as 'comName' , n_CityCovered as 'numCityCover' , n_Theaters as 'numTheater' , n_Employee as 'numEmployee'
				FROM adminmanagecompany
				WHERE company_name = i_comName AND (n_CityCovered BETWEEN i_minCity AND i_maxCity) AND (n_Theaters BETWEEN i_minTheater AND i_maxTheater) AND (n_Employee BETWEEN i_minEmployee AND i_maxEmployee)
				ORDER BY (CASE i_sortby
				WHEN 'comName' THEN company_name
				WHEN 'numCityCover' THEN n_CityCovered
				WHEN 'numTheater' THEN n_Theaters
				WHEN 'numEmployee' THEN n_Employee END) DESC;
			END IF;
        ELSE 
			IF (i_comName = 'ALL' OR i_comName = '') THEN
				DROP TABLE IF EXISTS AdFilterCom;
				CREATE TABLE AdFilterCom
				SELECT company_name as 'comName' , n_CityCovered as 'numCityCover' , n_Theaters as 'numTheater' , n_Employee as 'numEmployee'
				FROM adminmanagecompany
				WHERE (n_CityCovered BETWEEN i_minCity AND i_maxCity) AND (n_Theaters BETWEEN i_minTheater AND i_maxTheater) AND (n_Employee BETWEEN i_minEmployee AND i_maxEmployee)
				ORDER BY (CASE i_sortby
				WHEN 'comName' THEN company_name
				WHEN 'numCityCover' THEN n_CityCovered
				WHEN 'numTheater' THEN n_Theaters
				WHEN 'numEmployee' THEN n_Employee END) DESC;
			ELSE
				DROP TABLE IF EXISTS AdFilterCom;
				CREATE TABLE AdFilterCom
				SELECT company_name as 'comName'  , n_CityCovered as 'numCityCover' , n_Theaters as 'numTheater' , n_Employee as 'numEmployee'
				FROM adminmanagecompany
				WHERE company_name = i_comName AND (n_CityCovered BETWEEN i_minCity AND i_maxCity) AND (n_Theaters BETWEEN i_minTheater AND i_maxTheater) AND (n_Employee BETWEEN i_minEmployee AND i_maxEmployee)
				ORDER BY (CASE i_sortby
				WHEN 'comName' THEN company_name
				WHEN 'numCityCover' THEN n_CityCovered
				WHEN 'numTheater' THEN n_Theaters
				WHEN 'numEmployee' THEN n_Employee END) DESC;
			END IF;
		END IF;
    END IF;
END$$
DELIMITER ;


### SCREEN 15 admin_create_theater 

DROP PROCEDURE IF EXISTS admin_create_theater;
DELIMITER $$
CREATE PROCEDURE admin_create_theater(IN i_thName VARCHAR(50),IN i_comName VARCHAR(50), IN i_thStreet VARCHAR(50), IN i_thCity VARCHAR(50), IN i_thState CHAR(2),IN i_thZipcode CHAR(5),IN i_capacity INT(11),IN i_managerUsername VARCHAR(50))
BEGIN
	IF i_managerUsername NOT IN (select username from available_managers) 
		then select('Error: the manager is not available');
    else
		IF i_comName in (select company from available_managers where available_managers.username=i_managerUsername)
			then insert into theater (compname,theater_name,zipcode,street,city,state,capacity,username_mgr)values(i_comName,i_thName, i_thZipcode, i_thStreet, i_thCity, i_thState, i_capacity, i_managerUsername);
		else
        select('error');
        end if;
	end if;
END$$
DELIMITER ;

### SCREEN 16a admin_view_comDetail_emp

DROP PROCEDURE IF EXISTS admin_view_comDetail_emp;
DELIMITER $$
CREATE PROCEDURE admin_view_comDetail_emp(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdComDetailEmp;
    CREATE TABLE AdComDetailEmp
	select firstname as 'empFirstname',lastname as 'empLastname' from users left join manager using (username)
	where company=i_comName;
END$$
DELIMITER ;

###SCREEN 16b admin_view_comDetail_th

DROP PROCEDURE IF EXISTS admin_view_comDetail_th;
DELIMITER $$
CREATE PROCEDURE admin_view_comDetail_th (IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdComDetailTh;
    CREATE TABLE AdComDetailTh
	SELECT theater_name as 'thName',username_mgr as 'thManagerUsername', city as 'thCity', state as 'thState', capacity as 'thCapacity'
    FROM theater
    WHERE 
		compname=i_comName;
END$$
DELIMITER ;

###SCREEN 17 admin_create_mov

DROP PROCEDURE IF EXISTS admin_create_mov;
DELIMITER $$
CREATE PROCEDURE admin_create_mov(IN i_movName VARCHAR(50),in i_movDuration INT(10) ,in i_movReleaseDate date )
BEGIN
    insert into movie(movie_name,releasedate,duration) values(i_movName,i_movReleaseDate,i_movDuration);
END$$
DELIMITER ;

###SCREEN 18 test_view (Create a table based on the logged manager, that is he can only see the movies concerning his theater plus those that
#have not been played in his theater). 

DROP PROCEDURE IF EXISTS test_view;
DELIMITER $$
CREATE PROCEDURE test_view(IN i_username VARCHAR(50))
BEGIN
DROP TABLE IF EXISTS tobeused;
CREATE TABLE tobeused
select movie_name as 'movName', duration as 'movDuration' , releasedate as 'movReleaseDate', movieplay_date as 'movPlayDate'
from movie left join (select *
from theater, movieplay 
where compname = movieplay_compname and theater_name = movieplay_theatername
and username_mgr = i_username) as Ale on (movie_name = movieplay_name and movieplay_releasedate = releasedate);
END$$
DELIMITER ;

### SCREEN 18 manager_filter_th

DROP PROCEDURE IF EXISTS manager_filter_th;
DELIMITER $$
CREATE PROCEDURE manager_filter_th (IN i_manUsername varchar(50),IN i_movName VARCHAR(50) ,
 IN i_minMovDuration INT , IN i_maxMovduration INT,
IN i_minMovReleaseDate DATE , IN i_maxMovReleaseDate DATE ,  
IN i_minMovPlayDate DATE , IN i_maxMovPlayDate DATE,
IN i_includedNotPlay BOOL) 
BEGIN 

call Team52.test_view(i_manUsername);

IF i_manUsername not in (select username_mgr from theater) THEN select ('Manager does not manage a theater');END IF;
IF i_maxMovduration is null THEN SET i_maxMovduration = 1000; END IF;
IF i_minMovduration is null THEN SET i_minMovduration = 0; END IF;

IF (i_includedNotPlay = False or i_includedNotPLay is NULL)
THEN
DROP TABLE IF EXISTS ManFilterTh;
CREATE TABLE ManFilterTh
select movName, movDuration , movReleaseDate, movPlayDate
from tobeused
where ( movName LIKE CONCAT('%', i_movName , '%')
AND (movDuration between i_minMovDuration and i_maxMovduration)
AND (i_minMovReleaseDate is null OR movReleaseDate >= i_minMovReleaseDate)
AND (i_maxMovReleaseDate is null OR movReleaseDate <= i_maxMovReleaseDate)
AND (i_minMovPlayDate is null OR movPlayDate >= i_minMovPlayDate)
AND (i_maxMovPlayDate is null OR  movPlayDate <= i_maxMovPlayDate));
ELSE
DROP TABLE IF EXISTS ManFilterTh;
CREATE TABLE ManFilterTh 
select movName, movDuration , movReleaseDate, movPlayDate
from tobeused
where ( movName LIKE CONCAT('%', i_movName , '%')
AND (movDuration between i_minMovDuration and i_maxMovduration)
AND (i_minMovReleaseDate is null OR movReleaseDate >= i_minMovReleaseDate)
AND (i_maxMovReleaseDate is null OR movReleaseDate <= i_maxMovReleaseDate)
AND (i_minMovPlayDate is null OR movPlayDate >= i_minMovPlayDate)
AND (i_maxMovPlayDate is null OR  movPlayDate <= i_maxMovPlayDate))
AND (movPlayDate is NULL);
END IF;
END$$
DELIMITER ;


###SCREEN 19 manager_schedule_mov 

DROP PROCEDURE IF EXISTS manager_schedule_mov;
DELIMITER $$
CREATE PROCEDURE manager_schedule_mov(i_manUsername VARCHAR(50), i_movName VARCHAR(50), i_movReleaseDate DATE, i_movPlayDate DATE)
BEGIN 
	IF i_movPlayDate < i_movReleaseDate OR (i_movName, i_movReleaseDate) NOT IN (SELECT movie_name, releasedate FROM movie)
    OR (select capacity from theater where username_mgr = i_manUsername) = (select count(distinct movieplay_name) from movieplay where movieplay_theatername in 
    (select theater_name from theater where username_mgr = i_manUsername) and movieplay_date = i_movPlayDate)
	then select ('error');
    ELSE
    INSERT INTO movieplay VALUES ((SELECT company FROM manager WHERE username = i_manUsername), (SELECT theater_name FROM theater WHERE username_mgr = i_manUsername), i_movPlayDate, i_movName, i_movReleaseDate);
    END IF;
END$$
DELIMITER ;

##SCREEN 20 customer_filter_mov

DROP PROCEDURE IF EXISTS customer_filter_mov;
DELIMITER $$
CREATE PROCEDURE customer_filter_mov(IN i_movName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(50), IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE)
BEGIN 
	IF i_minMovPlayDate IS NULL THEN SET i_minMovPlayDate = '1980-01-01'; END IF;
    IF i_maxMovPlayDate IS NULL THEN SET i_maxMovPlayDate = '2030-01-01'; END IF;
	DROP TABLE IF EXISTS CosFilterMovie;
    CREATE TABLE CosFilterMovie
    SELECT t1.movieplay_name as 'movName', t1.movieplay_theatername as 'thName' , t2.street as 'thStreet', t2.city as 'thCity' ,t2.state as 'thState', t2.zipcode as 'thZipcode', t1.movieplay_compname as 'comName', t1.movieplay_date as 'movPlayDate', 
    t1.movieplay_releasedate as 'movReleaseDate'
	FROM movieplay as t1 JOIN theater as t2 ON (t1.movieplay_theatername = t2.theater_name) AND (t1.movieplay_compname = t2.compname)
    WHERE (t1.movieplay_name = i_movName OR i_movName = 'ALL')
    AND (t2.compname = i_comName OR i_comName = 'ALL' or i_comName = '')
    AND (t2.city = i_city OR i_city = '')
    AND (t2.state = i_state OR i_state = 'ALL' or i_state = '')
    AND (t1.movieplay_date BETWEEN i_minMovPlayDate AND i_maxMovPlayDate);
END$$
DELIMITER ;


###SCREEN 20b customer_view_mov

DROP PROCEDURE IF EXISTS customer_view_mov;
DELIMITER $$
CREATE PROCEDURE customer_view_mov(IN i_creditCardNum CHAR(16), IN i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_movPlayDate DATE)
BEGIN 
	IF (select count(*) from used join creditcard on u_creditcardnum = creditcardnum where u_date = i_movPlayDate) = 3 THEN SELECT('Users cannot view more than three movies per day');
    ELSE
	INSERT INTO used VALUES (i_creditCardNum, i_comName, i_thName, i_movPlayDate, i_movName, i_movReleaseDate);
    END IF;
END$$
DELIMITER ;

###SCREEN 21 customer_view_history

DROP PROCEDURE IF EXISTS customer_view_history;
DELIMITER $$
CREATE PROCEDURE customer_view_history(IN i_cusUsername VARCHAR(50))
BEGIN 
	DROP TABLE IF EXISTS CosViewHistory;
    CREATE TABLE CosViewHistory
    SELECT u_moviename as 'movName', u_theatername as 'thName', u_compname as 'comName', u_creditcardnum as 'creditCardNum', u_date as 'movPlayDate'
    FROM used JOIN creditcard ON creditcard.creditcardnum = used.u_creditcardnum
    WHERE creditcard.username = i_cusUsername;
END$$
DELIMITER ;

###SCREEN 22a user_filter_th

DROP PROCEDURE IF EXISTS user_filter_th;
DELIMITER $$
CREATE PROCEDURE user_filter_th(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(3))
BEGIN    
	DROP TABLE IF EXISTS UserFilterTh;    
	CREATE TABLE UserFilterTh 
	SELECT theater_name as 'thName', street as 'thStreet', city as 'thCity', state as 'thState', zipcode as 'thZipcode' , compname as 'comName' 
	FROM Theater   
	WHERE (theater_name = i_thName OR i_thName = "ALL")
	AND        (compname = i_comName OR i_comName = "ALL") 
	AND        (city = i_city OR i_city = "") 
	AND        (state = i_state OR i_state = "" or i_state = 'ALL');
END$$
DELIMITER ;

###SCREEN 22b user_visit_th

DROP PROCEDURE IF EXISTS user_visit_th;
DELIMITER $$
CREATE PROCEDURE user_visit_th (IN i_thName VARCHAR(50),  IN i_comName VARCHAR(50), IN i_visitDate DATE , IN i_username varchar(50))
BEGIN 
	DECLARE a int;
    SET a = (SELECT ID FROM visit ORDER BY ID DESC LIMIT 1) + 1;
	INSERT INTO visit VALUES (a ,i_visitDate, i_username, i_comName, i_thName);
END$$
DELIMITER ;

###SCREEN 23 user_filter_visitHistory

DROP PROCEDURE IF EXISTS user_filter_visitHistory;
DELIMITER $$
CREATE PROCEDURE user_filter_visitHistory(IN i_username VARCHAR(50), IN i_minVisitDate DATE, IN i_maxVisitDate DATE)
BEGIN 
	DROP TABLE IF EXISTS UserVisitHistory;
    CREATE TABLE UserVisitHistory
	SELECT t.theater_name as 'thName', t.street as 'thStreet', t.city as 'thCity', t.state 'thState', t.zipcode as 'thZipcode', t.compname as 'comName', v.v_date as 'visitDate'
    FROM visit AS v
		 JOIN
        theater AS t
        on (v_theatername = theater_name and v_compname = compname)
	WHERE
		(v_username = i_username) AND
        (i_minVisitDate IS NULL OR v_date >= i_minVisitDate) AND
        (i_maxVisitDate IS NULL OR v_date <= i_maxVisitDate);
END$$
DELIMITER ;



### EXTRA list_employee: based on a company gives a string of all the employees (useful for the screen in company detail)

DROP PROCEDURE IF EXISTS list_employee;
DELIMITER $$
CREATE PROCEDURE list_employee(IN i_companyname VARCHAR(50))
BEGIN
select GROUP_CONCAT(`firstname`,' ',`lastname` SEPARATOR ' , ') as 'Employees'
from users where username in (
select username 
from manager 
where company = i_companyname);
END$$
DELIMITER ;

#================================  END ================================