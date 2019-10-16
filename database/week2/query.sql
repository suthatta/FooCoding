use new_world;
-- 1 What is the capital of country X ? (Accept X from user)
select Capital
from country
where Name LIKE "Sweden";

prepare country from 
'select Capital from country where lower(Name) LIKE ?';
set @a = 'netherlands';
execute country using
@a;
set @a = 'sweden';
execute country using
@a;
deallocate prepare country;


--  2 List all the languages spoken in the region Y (Accept Y from user)
select count(Region), Region
from country
group by Region;
select Language
from countrylanguage c
  inner join country co on co.Code =c.CountryCode
where lower(Region) LIKE "North America"
;

prepare countrylanguage from 
'select Language from countrylanguage c inner join country co on co.Code =c.CountryCode where lower(Region) LIKE ?';
set @a = 'middle east';
execute countrylanguage  using
@a;
set @a = 'south america';
execute countrylanguage using
@a;
deallocate prepare countrylanguage;

-- 3 Find the number of cities in which language Z is spoken (Accept Z from user)
select Name
from city ci inner join countrylanguage c on ci.CountryCode = c.CountryCode
where Language LIKE "Thai%";
select count(1)
from city ci inner join countrylanguage c on c.CountryCode = ci.CountryCode
where lower(Language) LIKE "swedish";


prepare city from 
'select count(Name) from city ci inner join countrylanguage c on ci.CountryCode = c.CountryCode 
where Language LIKE ?';
set @a = 'swedish';
execute city using
@a;
set @a = 'spanish';
execute city using
@a;
deallocate prepare city;

-- 4 List all the continents with the number of languages spoken in each continent
select continent, count(language) as languages from country c 
inner join countrylanguage co on c.Code = co.CountryCode group by continent;

prepare country from 
'select continent, count(language) as languages from country c inner join countrylanguage co on c.Code = co.CountryCode group by continent';
execute country;
deallocate prepare country;

-- 5 Are there any countries that have A) Same official language B) Same region If yes, 
-- display those countries. If no, display TRUE or FALSE

select exists(select Name, Language, Region from country c 
inner join countrylanguage co on co.CountryCode = c.Code where Name LIKE "%sweden%");

select exists(select Name, Region, Language from country c inner join countrylanguage co on c.Code = co.CountryCode 
where IsOfficial = "T" group by Language order by Region);

/* */



/*art 2 : SQL research*/

/*I want to get alerts when a country has >= 10 languages. 
E.g. If a country X has 9 languages in the CountryLanguage table, 
and a user INSERTs one more row in the CountryLanguage table, 
then I should get an alert. How can I achieve this ? */

    /*Write the necessary SQL statements for this solution and
    Test your solution with example insert statements.*/
    
select Name, Region, count(Language) from countrylanguage co 
inner join country c on co.CountryCode =c.Code group by Name order by count(Language) Desc limit 18;

-- Create an insert trigger
create trigger insertLanguage on 
countrylanguage
for insert
as

          declare @CountryCode char(3);
          declare @Language char(30);
          declare @IsOfficial enum ('T','F') default 'F';
          declare @Percentage float (4,1);
          
	      select @CountryCode = s.CountryCode from inserted s;
          select @Language = s.Language from inserted s;
          select @IsOfficial  = s.lastname from inserted s;
          select @Percentage = s.Percentage from inserted s;
          set @activity = 'a country X has 9 languages';
			if insert into (Language)
                      set @activity = 'a country X has 9 languages'
	
          insert into myDatabase_new_world.dbo.countrylanguade(CountryCode, Language, IsOfficial, Percentage, activity)
                      values(@CountryCode @Language, @IsOfficial, @Percentage, @activity)
 
go

