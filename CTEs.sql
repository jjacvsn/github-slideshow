-- updated just to test GIT
select 
	PersonType, FirstName, MiddleName, LastName, EmailPromotion 
into AdventureWorks2012.Person.Person2
from AdventureWorks2012.Person.Person


select count(*) Total from AdventureWorks2012.Person.Person2 where LastName = 'Serrano' and left(FirstName,1) = 'A'

select Distinct FirstName, LastName, MiddleName from AdventureWorks2012.Person.Person2 where LastName = 'Serrano'  and left(FirstName,1) = 'A'




Update AdventureWorks2012.Person.Person2
	set MiddleName = 'CHANGED' where LastName = 'Serrano'  and left(FirstName,1) = 'A'


with cte as (select FirstName, LastName, MiddleName from AdventureWorks2012.person.Person where LastName = 'Serrano'  and left(FirstName,1) = 'A')
select p2.FirstName, p2.LastName, p2.MiddleName, cte.MiddleName
	from AdventureWorks2012.person.Person2 p2 inner join cte 
		on p2.FirstName = cte.FirstName and p2.LastName = cte.LastName


with cte as (select FirstName, LastName, MiddleName from AdventureWorks2012.person.Person where LastName = 'Serrano'  and left(FirstName,1) = 'A')
update AdventureWorks2012.person.Person2 set MiddleName = cte.MiddleName
	from AdventureWorks2012.person.Person2 p2 inner join cte 
		on p2.FirstName = cte.FirstName and p2.LastName = cte.LastName


-- Here's another testing code

use Pruebas
Go

create table Familia
	(ID int identity(1,1) Primary Key, Nombre varchar(100), IDPadre varchar(100))

insert into Familia
	values
		('Santi',7),
		 ('Agustin',12)

select * from Familia;


WITH RecursiveCTE (Id, Nombre, IDPadre) as (
	
	select ID, Nombre, IDPadre from Familia as f where IDPadre = 0
	union all 
	select f.ID, c.Nombre, f.IDPadre from Familia as f inner join RecursiveCTE as c
		on f.IDPadre = c.ID
	
)
select c.ID, c.Nombre, c.IDPadre, c.Nombre
from RecursiveCTE c 


select * 
	into #FamiliaTemp
from Familia where IDPadre <> 1

select * from #FamiliaTemp

with cte (ID, Nombre, IDPadre) as 
	(
	
		select * from Familia where IDPadre = 0
		union all 
		select * from cte
			
	)
	select * from cte