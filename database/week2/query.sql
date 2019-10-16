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


-- 5 Are there any countries that have A) Same official language B) Same region If yes, 
-- display those countries. If no, display TRUE or FALSE
select Name, Region , Language
from country c inner join countrylanguag co on co.CountryCode  =c.Code
order by desc;

select Name, Region , Language
from country c
  inner join countrylanguage co on co.CountryCode =c.Code
group by co.Language;

/* */
-- 4 List all the continents with the number of languages spoken in each continent
select continent, count(Language) as languages
from country c
  inner join countrylanguage co on c.Code = co.CountryCode
group by continent;




/*
art 2 : SQL research

I want to get alerts when a country has >= 10 languages. 
E.g. If a country X has 9 languages in the CountryLanguage table, 
and a user INSERTs one more row in the CountryLanguage table, 
then I should get an alert. How can I achieve this ?

    Write the necessary SQL statements for this solution and
    Test your solution with example insert statements.

*/

/*  Structur Tables Country, City, Language*/
CREATE TABLE `country`
(
  `Code` CHAR
(3) NOT NULL DEFAULT '',
  `Name` CHAR
(52) NOT NULL DEFAULT '',
  `Continent` enum
('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  `Region` CHAR
(26) NOT NULL DEFAULT '',
  `SurfaceArea` FLOAT
(10,2) NOT NULL DEFAULT '0.00',
  `IndepYear` SMALLINT
(6) DEFAULT NULL,
  `Population` INT
(11) NOT NULL DEFAULT '0',
  `LifeExpectancy` FLOAT
(3,1) DEFAULT NULL,
  `GNP` FLOAT
(10,2) DEFAULT NULL,
  `GNPOld` FLOAT
(10,2) DEFAULT NULL,
  `LocalName` CHAR
(45) NOT NULL DEFAULT '',
  `GovernmentForm` CHAR
(45) NOT NULL DEFAULT '',
  `HeadOfState` CHAR
(60) DEFAULT NULL,
  `Capital` INT
(11) DEFAULT NULL,
  `Code2` CHAR
(2) NOT NULL DEFAULT '',
  PRIMARY KEY
(`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `
country`
VALUES
  ('ABW', 'Aruba', 'North America', 'Caribbean', 193.00, NULL, 103000, 78.4, 828.00, 793.00, 'Aruba', 'Nonmetropolitan Territory of The Netherlands', 'Beatrix', 129, 'AW');


CREATE TABLE `city`
(
  `ID` INT
(11) NOT NULL AUTO_INCREMENT,
  `Name` CHAR
(35) NOT NULL DEFAULT '',
  `CountryCode` CHAR
(3) NOT NULL DEFAULT '',
  `District` CHAR
(20) NOT NULL DEFAULT '',
  `Population` INT
(11) NOT NULL DEFAULT '0',
  PRIMARY KEY
(`ID`),
  KEY `CountryCode`
(`CountryCode`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY
(`CountryCode`) REFERENCES `country`
(`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=4080 DEFAULT CHARSET=latin1;

CREATE TABLE `countrylanguage`
(
  `CountryCode` CHAR
(3) NOT NULL DEFAULT '',
  `Language` CHAR
(30) NOT NULL DEFAULT '',
  `IsOfficial` enum
('T','F') NOT NULL DEFAULT 'F',
  `Percentage` FLOAT
(4,1) NOT NULL DEFAULT '0.0',
  PRIMARY KEY
(`CountryCode`,`Language`),
  KEY `CountryCode`
(`CountryCode`),
  CONSTRAINT `countryLanguage_ibfk_1` FOREIGN KEY
(`CountryCode`) REFERENCES `country`
(`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


