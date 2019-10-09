create database world;
use world;
show databases;

drop table country;

create table country
(
  Country_Code varchar(3) NOT NULL DEFAULT '',
  Country_Name varchar(30) NOT NULL DEFAULT '',
  Continent ENUM('Asia','Africa','Antarctica','Australia', 'Europe','North America','South America') NOT NULL DEFAULT 'Europe',
  Region varchar
(25) NOT NULL DEFAULT '',
  Capital int
(11) NOT NULL DEFAULT 0,
Population int
(11) NOT NULL default 0,
  primary key
(Country_Code)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table city;
create table city
(
  Id int(11) NOT NULL
  auto_increment,
  City_Name varchar
  (30) NOT NULL DEFAULT '', 
  Country_Code varchar
  (3) NOT NULL DEFAULT '',
  District varchar
  (20) NOT NULL DEFAULT '',
  Population int
  (11) NOT NULL DEFAULT 0,
  primary key
  (Id),
  KEY Country_Code
  (Country_Code),
  CONSTRAINT city_ibfk_1 FOREIGN KEY
  (Country_Code) REFERENCES country
  (Country_Code)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


  insert into country
    (Country_Code,Country_Name,Continent,Region,Capital, Population)
  Values
    ('ABW', 'Aruba', 'North America', 'Caribbean', 0, 0),
    ('ANT', 'Netherlands Antilles', 'North America', 'Caribbean', 0, 0),
    ('ARE', 'United Arab Emirates', 'Asia', 'Middle East', 2, 0),
    ('ARG', 'Argentina', 'South America', 'South America', 60, 3),
    ('ARM', 'Armenia', 'Asia', 'Middle East', 80, 0),
    ('USA', 'United States', 'North America', 'North America', 5, 8),
    ('THA', 'Thailand', 'Asia', 'Southeast Asia', 9, 0),
    ('SWE', 'Sweden', 'Europe', 'Nordic Countries', 8, 0),
    ('DNK', 'Denmark', 'Europe', 'Nordic Countries', 2, 0),
    ('PHL', 'Philippines', 'Asia', 'Southeast Asia', 3, 2),
    ('IND', 'India', 'Asia', 'Southern and Central Asia', 5, 0),
    ('ESP', 'Spain', 'Europe', 'Southern Europe', 5, 0),
    ('TUR', 'Turkey', 'Asia', 'Middle East', 0, 0),
    ('CHN', 'China', 'Asia', 'Eastern Asia', 0, 8),
    ('PER', 'Peru', 'South America', 'South America', 0, 0);


  insert into city
    (Id,City_Name,Country_Code,District,Population)
  values
    (3320, 'Bangkok', 'THA', 'Bangkok', 6320174),
    (3321, 'Nonthaburi', 'THA', 'Nonthaburi', 292100),
    (3322, 'Nakhon Ratchasima', 'THA', 'Nakhon Ratchasima', 181400),
    (3323, 'Chiang Mai', 'THA', 'Chiang Mai', 171100),
    (3324, 'Udon Thani', 'THA', 'Udon Thani', 158100),
    (3325, 'Hat Yai', 'THA', 'Songkhla', 148632),
    (3326, 'Khon Kaen', 'THA', 'Khon Kaen', 126500),
    (3327, 'Pak Kret', 'THA', 'Nonthaburi', 126055),
    (3328, 'Nakhon Sawan', 'THA', 'Nakhon Sawan', 123800),
    (3329, 'Ubon Ratchathani', 'THA', 'Ubon Ratchathani', 116300),
    (3330, 'Songkhla', 'THA', 'Songkhla', 94900),
    (3331, 'Nakhon Pathom', 'THA', 'Nakhon Pathom', 94100),
    (3048, 'Stockholm', 'SWE', 'Lisboa', 750348),
    (3049, 'Gothenburg [GÃ¶teborg]', 'SWE', 'West GÃ¶tanmaan lÃ¤n', 466990),
    (3050, 'MalmÃ¶', 'SWE', 'SkÃ¥ne lÃ¤n', 259579),
    (3051, 'Uppsala', 'SWE', 'Uppsala lÃ¤n', 189569),
    (3052, 'LinkÃ¶ping', 'SWE', 'East GÃ¶tanmaan lÃ¤n', 133168),
    (3053, 'VÃ¤sterÃ¥s', 'SWE', 'VÃ¤stmanlands lÃ¤n', 126328),
    (3054, 'Ã–rebro', 'SWE', 'Ã–rebros lÃ¤n', 124207),
    (3055, 'NorrkÃ¶ping', 'SWE', 'East GÃ¶tanmaan lÃ¤n', 122199),
    (3056, 'Helsingborg', 'SWE', 'SkÃ¥ne lÃ¤n', 117737),
    (3057, 'JÃ¶nkÃ¶ping', 'SWE', 'JÃ¶nkÃ¶pings lÃ¤n', 117095),
    (3058, 'UmeÃ¥', 'SWE', 'VÃ¤sterbottens lÃ¤n', 104512),
    (3059, 'Lund', 'SWE', 'SkÃ¥ne lÃ¤n', 98948),
    (3060, 'BorÃ¥s', 'SWE', 'West GÃ¶tanmaan lÃ¤n', 96883),
    (3061, 'Sundsvall', 'SWE', 'VÃ¤sternorrlands lÃ¤', 93126),
    (3062, 'GÃ¤vle', 'SWE', 'GÃ¤vleborgs lÃ¤n', 90742);