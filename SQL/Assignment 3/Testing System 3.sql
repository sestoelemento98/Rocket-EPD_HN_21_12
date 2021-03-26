use ASSIGNMENT;

#Q1
create view Danhsach_Sale as
select A.Username, A.FullName, B.DepartmentName
	from Account A
    join Department B on A.DepartmentID = B.DepartmentID
    group by A.Username having B.DepartmentName = 'Sale';
    
select * from Danhsach_Sale;


#Q2
create view  Thamgianhieugroupnhat as
	select A.AccountID, A.Username, count(B.AccountID) as So_lan_thamgiagroup
	from Account A 
	 left join GroupAccount B on A.AccountID = B.AccountID
	group by A.AccountID, A.Username
    order by count(B.AccountID) desc limit 1;

select * from Thamgianhieugroupnhat;

#Q3
create view Nhungcauhoicocontentquadai as
	select * from Question where character_length(Content) > 300;

#Q4
drop view if exists Phongbanconhieunhanviennhat;

create view Phongbanconhieunhanviennhat as
select A.DepartmentName, count(B.DepartmentID) as Soluong 
from Department A
left join Account B on A.DepartmentID = B.DepartmentID
group by A.DepartmentName
order by count(B.DepartmentID) desc limit 1;

select * from Phongbanconhieunhanviennhat;

#Q5
drop view if exists A;
create view A as
select Q.QuestionID, Q.CreatorID
from Question Q
where CreatorID in (select AccountID from Account where FullName like 'Nguyen%' or 'Nguyễn%');

select * from A;

