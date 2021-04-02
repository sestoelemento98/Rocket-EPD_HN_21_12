drop database if exists ThucTap;
create database if not exists ThucTap;
use ThucTap;



-- Question 1
drop table if exists Country;
create table Country(
	country_id int auto_increment primary key,
    country_name varchar(50) not null
);

drop table if exists Location;
create table Location(
	location_id int auto_increment primary key,
    street_address varchar(100),
    postal_code int,
    country_id int,
    foreign key (country_id) references Country(country_id)
);

drop table if exists Employee;
create table Employee(
	employee_id int auto_increment primary key,
    full_name varchar (50),
    email varchar (100),
    location_id int,
    foreign key (location_id) references Location(location_id)
);


INSERT INTO `ThucTap`.`Country` (`country_id`, `country_name`) VALUES ('1', 'Vietnam');
INSERT INTO `ThucTap`.`Country` (`country_id`, `country_name`) VALUES ('2', 'China');
INSERT INTO `ThucTap`.`Country` (`country_id`, `country_name`) VALUES ('3', 'USA');
INSERT INTO `ThucTap`.`Country` (`country_id`, `country_name`) VALUES ('4', 'Germany');
INSERT INTO `ThucTap`.`Country` (`country_id`, `country_name`) VALUES ('5', 'UK');


INSERT INTO `ThucTap`.`Location` (`location_id`, `street_address`, `postal_code`, `country_id`) VALUES ('1', 'Hanoi', '100000', '1');
INSERT INTO `ThucTap`.`Location` (`location_id`, `street_address`, `postal_code`, `country_id`) VALUES ('2', 'HCM city', '100001', '1');
INSERT INTO `ThucTap`.`Location` (`location_id`, `street_address`, `postal_code`, `country_id`) VALUES ('3', 'Quangzhou', '400000', '2');
INSERT INTO `ThucTap`.`Location` (`location_id`, `street_address`, `postal_code`, `country_id`) VALUES ('4', 'L.A', '470000', '3');
INSERT INTO `ThucTap`.`Location` (`location_id`, `street_address`, `postal_code`, `country_id`) VALUES ('5', 'Frankfrut', '210000', '4');
INSERT INTO `ThucTap`.`Location` (`location_id`, `street_address`, `postal_code`, `country_id`) VALUES ('6', 'London', '440000', '5');

INSERT INTO `ThucTap`.`Employee` (`employee_id`, `full_name`, `email`, `location_id`) VALUES ('1', 'Nguyen Thanh Ha', 'hant16219@gmail.com', '1');
INSERT INTO `ThucTap`.`Employee` (`employee_id`, `full_name`, `email`, `location_id`) VALUES ('2', 'Nguyen Ngoc Ngan', 'nn03@gmail.com', '1');
INSERT INTO `ThucTap`.`Employee` (`employee_id`, `full_name`, `email`, `location_id`) VALUES ('3', 'Steve Jobs', 'job3456@gmail.com', '4');
INSERT INTO `ThucTap`.`Employee` (`employee_id`, `full_name`, `email`, `location_id`) VALUES ('4', 'JackMa', 'jm212828@alibaba.cn', '3');
INSERT INTO `ThucTap`.`Employee` (`employee_id`, `full_name`, `email`, `location_id`) VALUES ('5', 'Thomas Muller', 'muller13999@fifa.gr', '5');
INSERT INTO `ThucTap`.`Employee` (`employee_id`, `full_name`, `email`, `location_id`) VALUES ('6', 'Daniel Craig', 'craig28188@gmail.uk', '6');



-- Question 2 
-- a 
select e.full_name, e.employee_id, c.country_name
from Employee e 
join Location l on e.location_id = l.location_id
join Country c on l.country_id = c.country_id
where c.country_name = 'Vietnam';

-- b 
select c.country_name, e.email
from Country c 
join Location l on c.country_id = l.country_id
join Employee e on e.location_id = l.location_id
where e.email = 'nn03@gmail.com';


-- c 
select c.country_name, l.location_id, count(e.employee_id) as So_luong_nhan_vien
from Country c 
join Location l on c.country_id = l.country_id 
join Employee e on e.location_id = l.location_id
group by c.country_name, l.location_id;



-- Question 3
drop trigger if exists check_insert;
delimiter $$ 
	create trigger check_insert 
    before insert on Employee for each row
    begin
		if 
	end $$
delimiter ;



-- Question 4 
drop trigger if exists delete_location;
delimiter $$
	create trigger delete_location 
    after delete on Location for each row
    begin
		
	end $$
delimiter ;