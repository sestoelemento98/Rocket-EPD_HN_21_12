use ASSIGNMENT;



-- Q1
drop procedure if exists get_department_account;
DELIMITER $$
	CREATE PROCEDURE get_department_account (IN department_name nvarchar(30), OUT department_account nvarchar(500))
		BEGIN
			select a.AccountID into department_account  
            from `Account` a 
            inner join `Department` d on a.DepartmentID = d.DepartmentID
            where d.DepartmentName  = department_name;
		END$$ 
DELIMITER ;


set @department_account = '';
call get_department_account('Kỹ thuật', @department_account);
select @department_account;

-- Q2
drop procedure if exists get_account_count;

DELIMITER $$
	create procedure get_account_count (out account_count tinyint)
		begin
			select g.GroupName, count(ga.AccountID) as So_luong_account into account_count
			from `Group` g 
			right join GroupAccount ga on g.GroupID = ga.GroupID
			group by g.GroupName;
        end $$
DELIMITER ;

set @account_count = '' ;
call get_account_count(@account_count);
select @account_count;

-- Q3
drop procedure if exists Q3;
delimiter $$
	create procedure Q3 (out soluongcauhoitrongthanghientai varchar(100))
		begin
			select t.TypeName, q.CreateDate,count(q.QuestionID) as So_luong_cau_hoi into soluongcauhoitrongthanghientai
			from TypeQuestion t
			right join Question q on t.TypeID = q.TypeID
			where q.CreateDate in (Select CreateDate from Question where month(CreateDate) = 4);
		end $$
delimiter ;

set @countquestion = '';
call Q3(@countquestion);
select @countquestion;


-- Q4
drop procedure if exists Q4;

delimiter $$
	create procedure Q4 (out typequestionconhieucauhoinhat varchar(100))
		begin
			select tq.TypeID, count(q.QuestionID) as Soluongcauhoi into typequestionconhieucauhoinhat
			from TypeQuestion tq
			join Question q on tq.TypeID = q.TypeID
			where count(q.QuestionID) = max((select count(QuestionID) from Question));
		end $$
delimiter ;

set @answer4 = '';
call Q4(@answer4);
select @answer4;

-- Q5
drop procedure if exists Q4;

delimiter $$
	create procedure Q4 (out typequestionconhieucauhoinhat varchar(100))
		begin
			select tq.TypeName, count(q.QuestionID) as Soluongcauhoi into typequestionconhieucauhoinhat
			from TypeQuestion tq
			join Question q on tq.TypeID = q.TypeID
			where count(q.QuestionID) = max((select count(QuestionID) from Question));
		end $$
delimiter ;

set @answer4 = '';
call Q4(@answer4);
select @answer4;

-- Q6
drop procedure if exists Q6;

delimiter $$
	create procedure Q6 (in dauvao varchar(30), out daura varchar (100))
		begin
			select g.GroupName, a.Username into daura
            from `Group` g 
            join `Account` a on g.CreatorID = a.AccountID
            where g.GroupName = dauvao  in (g.GroupName) or a.Username = dauvao in (a.Username);
		end $$
delimiter ;


set @answer6 = '';
call Q6('VTI', @answer6);
call Q6('vanc', @answer6);
select @answer6;



-- Q7 ?????


-- Q8
drop procedure if exists Q8;

delimiter $$
	create procedure Q8 (in dauvao Enum('Essay','Multiple-Choice'), out daura varchar(100))
		begin
			select tq.TypeName, character_length(q.Content) into daura
            from TypeQuestion tq
            join Question q on tq.TypeID = q.TypeID
            where tq.TypeName = dauvao and tq.TypeName = max(select character_length(Content) from Question);
		end $$
delimiter ;

set @answer8 = '';
call Q8('Essay', @answer8);
call Q8('Multiple-Choice', @answer8);

select @answer8;


-- Q9
drop procedure if exists Q9;

delimiter $$
	create procedure Q9 (in dauvao tinyint)
		begin
			delete from `Exam` where ExamID = dauvao;
		end $$
delimiter ;

call Q9(1);

-- Q10
drop procedure if exists Q10;
delimiter $$
	create procedure Q10 (in dauvao tinyint, out daura varchar(100))
		begin
			select * into daura from `Exam` where ExamID = dauvao and CreateDate in (select CreateDate from `Exam` where year(now()) - year(CreateDate) = 3);
			delete from `Exam` where ExamID = dauvao and CreateDate in (select CreateDate from `Exam` where year(now()) - year(CreateDate) = 3);
delimiter ;

set @answer10 = '';
call Q10();
select @answer10;

-- Q11

drop procedure if exists Q11;

delimiter $$
	create procedure Q11(in dauvao tinyint)
		begin
			declare ketqua varchar(50) default 'Phong ban cho viec';
            
			select * into ketqua from `Account` where AccountID = dauvao and DepartmentID = ketqua;
        end $$
delimiter ;

-- Q12

-- Q13


