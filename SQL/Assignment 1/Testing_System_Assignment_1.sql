use SQL1;

insert into Account (Email, Username, Fullname, CreateDate)
values ('hant16219@gmail.com', 'hant16219', 'Nguyen Thanh Ha', date '2021-03-18'),
		('nguyenvana@gmail.com', 'A18882', 'Nguyen Van A',  date '2021-02-01'),
        ('nguyenvanb@gmail.com', 'B13222', 'Nguyen Van B',  date '2021-02-04'),
        ('nguyenvanc@gmail.com', 'C99909', 'Nguyen Van C',  date '2021-02-19'),
        ('nguyenvand@gmail.com', 'D19223', 'Nguyen Van D',  date '2021-02-28');
        

insert into Department (DepartmentID ,DepartmentName)
values (1, 'Developer'), (2,'Tester'), (3,'HR'), (4,'Sales'), (5,'Marketing');

insert into Department_Position (PositionName)
values ('Dev'), ('Test'), ('Scrum Master'), ('PM'), ('Dev');

insert into Group1 (GroupName, CreatorID, CreateDate)
values ('GroupA', 31112, date '2021-01-31'),
		('GroupB', 97512, date '2021-01-30'),
        ('GroupC', 28475, date '2021-01-29'),
        ('GroupD', 14924, date '2021-01-28'),
        ('GroupE', 19503, date '2021-01-27');
        
insert into GroupAccount (GroupID, AccountID, JoinDate)
values (28822, 83833, date '2021-1-09'),
		(43849, 34444, date '2021-1-10'),
        (23232, 52632, date '2021-1-11'),
        (22222, 55242, date '2021-1-03'),
        (66635, 13523, date '2021-1-07');
        
insert into CategoryQuestion (CategoryName)
values ('Java', '.NET', 'SQL', 'Postman', 'Ruby');

insert into TypeQuestion (TypeName)
values ('Essay', 'Multiple-Choice', 'Coding', 'Quiz', 'Discuss');

insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
values ('How to learn Java?', 11, 1, 111, date '2021-01-10'),
	('How to learn .NET?', 12, 2, 332, date '2021-01-11'),
	('How to learn SQL?', 13, 3, 122, date '2021-01-12'),
	('How to learn Postman?', 14, 4, 123, date '2021-01-13'),
	('How to learn Ruby?', 15, 5, 132, date '2021-01-14');
    
insert into Answer (AnswerID, Content, QuestionID, isCorrect)
values (1 , 'How to learn Java?', 1, 1),
		(2 , 'How to learn .NET?', 2, 1),
		(3 , 'How to learn SQL?', 3, 0),
		(4 , 'How to learn Postman?', 4, 0),
		(5 , 'How to learn Ruby?', 5, 1);
		
insert into Exam (Code,Title,CategoryID,Duration,CreatorID,CreateDate)
values ('JAVA101', 'Java for beginner', 1, datetime ('2021-01-30 14:30:00'), 111, date ('2021-01-12')),
		('.NET101', '.NET for beginner', 2, datetime ('2021-01-30 15:30:00'), 222, date ('2021-01-13')),
        ('SQL101', 'SQL for beginner', 3, datetime ('2021-01-30 16:30:00'), 333, date ('2021-01-14')),
        ('PM101', 'Postman for beginner', 4, datetime ('2021-02-01 14:30:00'), 444, date ('2021-01-125')),
        ('RUBY101', 'Ruby for beginner', 5, datetime ('2021-02-01 15:30:00'), 555, date ('2021-01-16'));
        
insert into ExamQuestion(ExamID,QuestionID)
values (1,1), (2,2), (3,3), (4,4), (5,5);
