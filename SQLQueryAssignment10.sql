------------1------------
select [Name], ProductNumber, ListPrice 'Price'
from Production.Product

------------2------------
select *
from HumanResources.Employee
where HireDate>'2009-01-01'

------------3------------
select *
from Production.Product
where ProductLine='S' and DaysToManufacture>5
order by DaysToManufacture asc

------------4------------
select distinct JobTitle
from HumanResources.Employee

------------5------------
select COUNT(OrderQty)
from Sales.SalesOrderDetail

------------6------------
select ProductID
from Sales.SalesOrderDetail
where UnitPrice > '900'
group by ProductID

------------7------------
select ProductID, AVG(OrderQty)'OrderQty average'
from Sales.SalesOrderDetail
group by ProductID
having AVG(OrderQty) > 4

------------8------------
Create Procedure uspGetEmployeeManagersPerDepartment(@BusinessEntityID int, @Department nvarchar(50))
as begin

select EMP.BusinessEntityID,P.FirstName, P.LastName, EMP.JobTitle, EMP.JobTitle, EMP.Gender, A.FirstName, A.LastName
from HumanResources.Employee EMP join Person.Person P on  EMP.BusinessEntityID = P.BusinessEntityID join HumanResources.EmployeeDepartmentHistory ED on ED.BusinessEntityID = P.BusinessEntityID  left join 
(
select P.FirstName, P.LastName, EDH.DepartmentID
from HumanResources.EmployeeDepartmentHistory EDH join HumanResources.Employee E on E.BusinessEntityID=EDH.BusinessEntityID	join Person.Person P on E.BusinessEntityID=P.BusinessEntityID
where E.JobTitle like('%Manager%')
) A on  A.DepartmentID = ED.DepartmentID
where  EMP.BusinessEntityID=4

end
