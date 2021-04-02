drop database if exists TEST;
create database if not exists TEST;
use TEST;

drop table if exists Employee;
create table Employee(
	EmployeeID int auto_increment primary key,
    EmployeeLastName varchar(50),
    EmployeeFirstName varchar(50),
    EmployeeHireDate timestamp,
    EmployeeStatus int,
    SupervisorID int,
    SocialSecurityNumber int
);

drop table if exists Projects;
create table Projects(
	ProjectID int auto_increment primary key,
    ProjectName varchar (100),
    ProjectStartDate timestamp,
    ProjectDescription varchar(100),
    ProjectDetail varchar (200),
    ProjectCompleteOn timestamp
);


drop table if exists Project_Modules;
create table Project_Modules(
	ModuleID int auto_increment  primary key,
    ProjectID int,
    foreign key (ProjectID) references Projects(ProjectID),
    ProjectModulesDate timestamp,
    ProjectModulesCompleteOn timestamp,
    ProjectModulesDescription varchar(100)
);

drop table if exists Work_Done;
create table Work_Done(
	WorkDoneID int auto_increment  primary key,
    EmployeeID int,
    foreign key (EmployeeID) references Employee(EmployeeID),
    ModuleID int,
    foreign key (ModuleID) references Project_Modules(ModuleID),
    WorkDoneDate timestamp,
    WorkDoneDescription varchar(100),
    WorkDoneStatus int
);


-- b
drop procedure if exists remove_3month;
delimiter $$
	create procedure remove_3month()
		begin
			delete from Projects where WorkDoneDate <= now() - interval 3 month;
        end $$
delimiter ;

call remove_3month();

-- c
drop procedure if exists working_module;
delimiter $$
	create procedure working_module(out daura varchar(50))
		begin
			select * from Project_Modules where ProjectModulesCompleteOn is null;
		end $$
delimiter ;


-- d
drop function if exists check_employee;
delimiter $$
	create function check_employee (daura varchar(100)) returns varchar(100)
		begin
			declare daura varchar(100);
			select * into daura from Employee where EmployeeStatus = 1 and SupervisorID = null;
            
            return daura;
        end $$
delimiter ;

call check_employee();


-- them cau e viet ham tra ve thong tin nhan vien dang lam va co ng giao viec & in them thong tin ng giao viec (extra assignment)
drop function if exists check_employee1;
delimiter $$
	create function check_employee1 (daura varchar(100)) returns varchar(100)
		begin
			declare daura varchar(100);
			select * into daura from Employee where EmployeeStatus = 1 and SupervisorID is null;
            ...
            return daura;
        end $$
delimiter ;

call check_employee();