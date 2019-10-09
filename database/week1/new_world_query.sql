/*10 Questions from homework week1*/

/*1.What are the names of countries with population greater than 8 million*/
select Name, Population
from country
where Population > 8000000;

/*2.What are the names of countries that have “land” in their names ?*/
select Name
from country
where Name LIKE "%land%";

/*3.What are the names of the cities with population in between 500,000 and 1 million ?*/
select Name, Population
from city
where Population BETWEEN 500000 AND 1000000;
/*.count how many city between 50000-1000000;*/
select count(Name)
from city
where Population BETWEEN 500000 AND 1000000;/*303*/

/*4.What's the name of all the countries on the continent ‘Europe’ ?*/
select Name
from country
where Continent = 'Europe';
select count(Name)
from country
where Continent = 'Europe';/*46 country*/

/*5.List all the countries in the descending order of their surface areas.*/
select Name, SurfaceArea
from country
order by SurfaceArea DESC;

/*6.What are the names of all the cities in the Netherlands?*/
select city.Name, country.Name
from country INNER JOIN city ON city.countryCode = country.Code
where country.Name LIKE 'Netherlands';
/*counting how many */
select count(city.name)
from country INNER JOIN city ON city.countryCode = country.Code
where country.Name LIKE 'Netherlands';
/*7.What is the population of Rotterdam ?*/
select Population
from city
where Name LIKE 'Rotterdam';

/*8.What's the top 10 countries by Surface Area ?*/
select Name, SurfaceArea
from country
order by SurfaceArea DESC limit 10;

/*9.What's the top 10 most populated cities?*/
 select Name
, Population from city ORDER BY Population DESC limit 10;

/*10.What is the population of the world ?*/
select sum(Population)
from country;
select sum(Population) as WorldsPopulation
from country;
