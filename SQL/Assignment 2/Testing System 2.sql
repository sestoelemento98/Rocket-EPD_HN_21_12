use ASSIGNMENT;

#Question 1
select * from Department;

#Question 2
select DepartmentID from Department where DepartmentName = 'Sale';

#Question 3
select *  from Account order by length(FullName) desc limit 1;

#Question 4
select GroupName from `Group` where CreateDate < '2019-12-20';

#Question 5
select QuestionID
from Answer
 group by QuestionID having count(QuestionID) >= 4;

#Question 6
select * from `Group` order by CreateDate DESC limit 5;

#Question 8
delete from Exam where CreateDate < '2019-12-20';

#Question 9
update Account
set FullName = N'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn', Username = 'nguyenbaloc'
where AccountID = 5;

#Question 10
select AccountID, FullName, Account.DepartmentID, DepartmentName
from `Account`
inner join Department on `Account`.DepartmentID = `Department`.DepartmentID;

#Question 11
select AccountID, FullName, Account.DepartmentID, DepartmentName
from `Account`
inner join Department on `Account`.DepartmentID = `Department`.DepartmentID
where DepartmentName = N'Kỹ thuật';

#Question 12
select  Account.DepartmentID, DepartmentName
from `Account`
inner join Department on `Account`.DepartmentID = `Department`.DepartmentID
group by DepartmentID having count(Account.DepartmentID) > 3;

#Question 13
select count(EQ.QuestionID) as Tan_suat , QC.Content
from ExamQuestion as EQ
join Question as QC on EQ.QuestionID = QC.QuestionID
group by QC.Content 
order by Tan_suat desc;

#Question 14
select count(Q.CategoryID), CQ.CategoryName
from Question as Q
join CategoryQuestion as CQ on Q.CategoryID = CQ.CategoryID
group by CQ.CategoryName 
order by count(Q.CategoryID);

#Question 15
select count(A.QuestionID) as So_lan_tra_loi, Q.Content
from Question as Q
join Answer as A on A.QuestionID = Q.QuestionID
group by Q.Content 
order by So_lan_tra_loi desc;

#Question 16
select count(A.PositionID) as So_luong, P.PositionName as Chuc_vu
from Account as A
right join Position as P on A.PositionID = P.PositionID
group by Chuc_vu
order by So_luong ;

#Question 17 (chua thong ke duoc moi phong ban co nhung vi tri gi)

select Account.AccountID,Account.FullName, Department.DepartmentName, Position.PositionName, Account.PositionID
from Account
inner join Department on Account.DepartmentID = Department.DepartmentID
inner join Position on Account.PositionID = Position.PositionID
group by Account.AccountID 
order by count(Account.PositionID);

#Question 18 (da hien thi duoc het thong tin tru phan answer cua cau hoi)

select Q.QuestionID, Q.Content, C.CategoryName, T.TypeName, Ans.AnswerID ,A.FullName, Q.CreateDate

from Question as Q
inner join CategoryQuestion as C on Q.CategoryID = C.CategoryID
inner join TypeQuestion as T on Q.TypeID = T.TypeID
inner join Account as A on Q.CreatorID = A.AccountID
inner join Answer as Ans on Q.QuestionID = Ans.QuestionID
group by Q.QuestionID;


#Question 19

select count(Question.QuestionID) as So_luong, TypeQuestion.TypeName as Loai_cau_hoi

from Question 
join TypeQuestion on Question.TypeID = TypeQuestion.TypeID
group by Loai_cau_hoi
order by count(Question.QuestionID);