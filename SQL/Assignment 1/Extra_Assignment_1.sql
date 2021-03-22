drop database if exists FRESHER;
create database if not exists FRESHER;
use FRESHER;

#Exercise1
drop table if exists Trainee;
create table Trainee (
	TraineeID tinyint auto_increment primary key,
    Full_Name nvarchar (50) not null ,
    Birth_Date datetime not null,
    Gender enum('male', 'female', 'unknown' ) default'unknown',
    ET_IQ int not null check (ET_IQ <= 20),
    ET_Gmath int not null check (ET_Gmath <= 20),
    ET_English int not null check (ET_English <= 50),
    Training_Class  tinyint not null,
    Evaluation_Notes nvarchar(100)
);

alter table Trainee
add column VTI_Account nvarchar(50) not null unique;

#Exercise2
/*ID unsigned int auto_increment
Name varchar (50) not null	
Code char(10)	not null
ModifiedDate datetime not null*/

#Exercise3
/*ID unsigned int auto_increment
Name varchar (50) not null
Birthdate date notnull
Gender Enum('Male', 'Female') default 'unknown'
isDeletedFlag bit */