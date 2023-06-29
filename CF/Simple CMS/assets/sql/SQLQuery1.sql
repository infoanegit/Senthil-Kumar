use [trainingdb]

create table simplecms(

userId int IDENTITY(1,1) NOT NULL,
userName  varchar(150) NOT NULL,
pwd varchar(150) NOT NULL,
Role varchar (150) NOT NULL)

select * from simplecms

INSERT INTO simplecms(userName,pwd,Role)
VALUES ('senthil', '123','Admin'),
		('SK', '321','Editor'),
		('yoshva', '456','User')

select * from  list

drop table simplecms
truncate table list

create table list(
	
	ID int IDENTITY(1,1) NOT NULL,
	Name [varchar](150) NULL,
	Description varchar(150) NULL)
	
	select * from list


	


