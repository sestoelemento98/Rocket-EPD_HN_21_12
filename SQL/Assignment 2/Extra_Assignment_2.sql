use FRESHER;

alter table Trainee
modify column Birth_Date date not null;
insert into Trainee
values (1, 'Nguyen Thanh Ha', '1998-10-10', 'male', 15, 17, 40, 1, 'Nothing to comment', 'GCH16219'),
		(2, 'Nguyen Phuong Thao', '1999-10-4', 'female', 20, 19, 45, 2, 'Nothing to comment', 'GCH17919'),
        (3, 'Trinh Van Duy', '1998-12-08', 'male', 14, 13, 30, 3, 'Nothing to comment', 'GBH82922'),
        (4, 'Vu Thanh Hai', '1995-06-27', 'male', 14, 14, 26, 4, 'Nothing to comment', 'GDH19284'),
        (5, 'Tran Trung Hieu' ,'1998-07-26', 'male', 16, 18, 43, 1, 'Nothing to comment', 'GCH13233'),
        (6, 'Duong Hanh Dung', '1997-12-03', 'female', 15, 16, 35, 2, 'Nothing to comment', 'GDH12950'),
        (7, 'Pham Huy Hoang', '1998-07-10', 'male', 17, 17, 46, 3, 'Nothing to comment', 'GCH16459'),
        (8, 'Bui Viet Anh', '1998-10-10', 'male', 12, 11, 38, 4, 'Nothing to comment', 'GCH16779'),
		(9, 'Mac Thai Binh', '1998-10-18', 'male', 12, 11, 35, 1, 'Nothing to comment', 'GCH16619'),
        (10, 'Vu Dung Nhi', '1999-10-12', 'female', 16, 18, 45, 2, 'Nothing to comment', 'GCH14319');
        
        
#Exercise2
#Q2
select t.Full_Name, month(t.Birth_Date) as `Month`
from Trainee t order by `Month`;

#Q3
select t.Full_Name, t.Birth_Date, t.Gender, t.ET_IQ, t.ET_Gmath, t.ET_English, t.Training_Class, t.Evaluation_Notes, t.VTI_Account
from Trainee t
order by length(t.Full_Name) desc limit 1;

#Q4
select t.Full_Name as ET from Trainee as t
where t.ET_IQ + t.ET_Gmath >= 20 and ET_Gmath>=8 and ET_IQ>=8 and ET_English>=18;

#Q5
delete from Trainee where TraineeID = 3;

#Q6
update Trainee 
set Training_Class = 2 where TraineeID = 5;


#Exercise2
#Q1
drop table if exists Department;
create table Department(
	DepartmentNumber tinyint auto_increment primary key,
    DepartmentName nvarchar(50) not null
);

drop table if exists Employee;
create table Employee(
	EmployeeNumber tinyint auto_increment primary key,
    EmployeeName nvarchar(50) not null,
    DepartmentNumber tinyint,
    foreign key (DepartmentNumber) references Department(DepartmentNumber)
);

drop table if exists EmployeeSkill;
create table EmployeeSkill(
	EmployeeNumber tinyint,
    foreign key (EmployeeNumber) references Employee(EmployeeNumber),
    Skill varchar(20) not null ,
    DateRegistered date not null
    
);

#Q2
INSERT INTO Department(DepartmentName) 
VALUES
						(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);
                        
                        
insert into Employee (EmployeeName, DepartmentNumber)
values ('Nguyễn Văn A', 1),
		('Nguyễn Văn B', 2),
        ('Nguyễn Văn C', 3),
        ('Nguyễn Văn D', 4),
        ('Nguyễn Văn E', 5),
        ('Nguyễn Thị A', 6),
        ('Nguyễn Thị B', 7),
        ('Nguyễn Thị C', 8),
        ('Nguyễn Thị D', 9),
        ('Nguyễn Thị E', 10);

insert into EmployeeSkill (EmployeeNumber, Skill, DateRegistered)
values (1, 'Java', '2021-01-01'),
		(1, 'C#', '2021-01-01'),
		(1, 'PHP', '2021-01-01'),
		(2, 'Python', '2021-01-02'),
		(2, 'C#', '2021-01-02'),
		(3, 'Java', '2021-01-03'),
		(4, 'C#', '2021-01-04'),
		(5, 'PHP', '2021-01-05'),
		(6, 'Python', '2021-01-06'),
		(7, 'C#', '2021-01-07'),
		(8, 'Java', '2021-01-08'),
		(9, 'PHP', '2021-01-09'),
		(10, 'Python', '2021-01-10');

#Q3
select E.EmployeeName, ES.Skill
from Employee as E
join EmployeeSkill as ES on E.EmployeeNumber = ES.EmployeeNumber
where ES.Skill = 'Java';

#Q4
select D.DepartmentName, count(E.EmployeeNumber) as Phong_ban
from Department D
join Employee E on D.DepartmentNumber = E.DepartmentNumber
group by D.DepartmentName having count(E.EmployeeNumber) > 3;

#Q5
select E.EmployeeName, D.DepartmentName
from Employee E
join Department D on E.DepartmentNumber = D.DepartmentNumber
; 
#Q6
select E.EmployeeName, ES.Skill
from Employee E
join EmployeeSkill as ES on E.EmployeeNumber = ES.EmployeeNumber
group by E.EmployeeName having count(ES.Skill) > 1;