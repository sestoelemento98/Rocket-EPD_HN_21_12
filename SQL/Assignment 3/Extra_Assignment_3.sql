use adventureworks;

#Q1
select `Name`
from Product
where ProductSubcategoryID in (select ProductSubcategoryID from productsubcategory where `Name` = 'Saddles');

#Q2
select `Name`
from Product
where ProductSubcategoryID in (select ProductSubcategoryID from productsubcategory where `Name` like 'Bo%');

#Q3
select `name`, ProductSubcategoryID from Product
where ProductSubcategoryID in (select ProductSubcategoryID from productsubcategory where ProductSubcategoryID = 3)
							and ListPrice = (select min(ListPrice) from productsubcategory where  ProductSubcategoryID = 3);
                            
#EX2
#Q1
select c.`Name`, p.`Name`
from  countryregion as c
join stateprovince as p on c.CountryRegionCode = p.CountryRegionCode
group by c.`Name`, p.`Name`;

#Q2
select c.`Name`, p.`Name`
from  countryregion as c
join stateprovince as p on c.CountryRegionCode = p.CountryRegionCode
group by c.`Name`, p.`Name` having c.`Name` in ('Canada', 'Germany')
order by c.`Name`;

#Q3
#Q4
