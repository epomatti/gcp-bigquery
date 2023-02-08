
CREATE TABLE Orders (
    OrderID int,
    Description varchar(255),
    Amount decimal(10,2),
    ExtraField1 varchar(255),
    ExtraField2 varchar(255),
    ExtraField3 varchar(255)
);

INSERT INTO 
	Orders(OrderID, Description, Amount, ExtraField1, ExtraField2, ExtraField3)
VALUES
	(1,'Order 1',10,'field1','field2','field3'),
	(2,'Order 2',10,'field1','field2','field3'),
	(3,'Order 3',10,'field1','field2','field3'),
	(4,'Order 4',10,'field1','field2','field3'),
	(5,'Order 5',10,'field1','field2','field3');
	
commit;

-- This user is required for Datastream
CREATE USER 'datastream'@'%' IDENTIFIED BY 'p4ssw0rd';
GRANT REPLICATION SLAVE, SELECT, RELOAD, REPLICATION CLIENT, LOCK TABLES, EXECUTE ON *.* TO 'datastream'@'%';
FLUSH PRIVILEGES;