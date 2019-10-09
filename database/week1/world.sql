drop database if exists world;
create database
if not exists world;
use world;
show tables;
drop table if exists country;
create table country
(
  Country_Code varchar(3) NOT NULL DEFAULT '',
  Country_Name varchar(30) NOT NULL DEFAULT '',
  Country_Continent ENUM('Asia','Europe','NorthAmerica','SouthAmerica') NOT NULL DEFAULT 'Europe',
  Country_Region varchar
(25) NOT NULL DEFAULT '',
  Country_Population int
(11) NOT NULL default 0,
  primary key
(Country_Code)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table if exists city;
create table city
(
  City_code int(11) NOT NULL
  AUTO_INCREMENT,
  City_Name varchar
  (35) NOT NULL DEFAULT '', 
  Country_Code varchar
  (3) NOT NULL DEFAULT '',
  City_Population int
  (11) NOT NULL DEFAULT 0,
  primary key
  (City_code),
  foreign key
  (Country_Code) REFERENCES country
  (Country_Code)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

  /*insert into country (Country_Code,Country_Name,Continent,Region,Capital, Population)  Values*/
  insert into country
  value('SIP','Singapo','Asia','Caribbean',
  0
  );
  insert into country
  value
  ('NDL',
  'Netherlands',
  'Europe',
  'Caribbean',
  0
  );
  insert into country
  value
  ('IND',
  'India',
  'Asia',
  'Middle East',
  0
  );
  insert into country
  value('AGT',
  'Argentina',
  'SouthAmerica',
  'SouthAmerica',
  3
  );
  insert into country
  value('TKY',
  'Turkey',
  'Europe',
  'Middle East',
  0
  );
  insert into country
  value
  ('USA',
  'United States',
  'NorthAmerica',
  'NorthAmerica',
  8
  );
  insert into country
  value('THA',
  'Thailand',
  'Asia',
  'Asia',
  0
  );
  insert into country
  value('SWE',
  'Sweden',
  'Europe',
  'NordicCountries',
  0
  );
  insert into country
  value('DNK',
  'Denmark',
  'Europe',
  'NordicCountries',
  0
  );
  insert into country
  value('PHL',
  'Philippines',
  'Asia',
  'SoutheastAsia',
  2
  );
  insert into country
  value('LOS',
  'Los',
  'Asia',
  'SouthernAsia',
  0
  );
  insert into country
  value('SPN',
  'Spain',
  'Europe',
  'Southern Europe',
  0
  );
  insert into country
  value('CND',
  'Cannada',
  'SouthAmerica',
  'MiddleEast',
  0
  );
  insert into country
  value('CHN',
  'China',
  'Asia',
  'EasternAsia',
  8
  );
  insert into country
  value('PER',
  'Peru',
  'SouthAmerica',
  'SouthAmerica',
  0
  );

  select count(*) as TotalCountries
  from country;

  /*insert into city   values (City_code,City_Name,Country_Code,City_Population)*/
  insert into city
  value
  (1,
  'Bangkok',
  'THA',
  60
  );
  insert into city
  value
  (2,
  'Azabajan',
  'IND',
  100
  );
  insert into city
  value
  (3,
  'AroiDee',
  'CND',
  400
  );
  insert into city
  value(4,
  'ChiangMai',
  'AGT',
  100
  );
  insert into city
  value(5,
  'Udon',
  'THA',
  158
  );

  insert into city
  value(9,
  'WhiteHarbor',
  'NDL',
  800
  );
  insert into city
  value(13,
  'Stockholm',
  'SWE',
  748
  );
  insert into city
  value(14,
  'Mantarys',
  'SWE',
  90
  );
  insert into city
  value(15,
  'Malmo',
  'SWE',
  79
  );
  insert into city
  value(16,
  'KingInTheNorr',
  'NDL',
  569
  );
  insert into city
  value(17,
  'Landstring',
  'CHN',
  68
  );
  insert into city
  value(18,
  'Vasterland',
  'CHN',
  28
  );
  insert into city
  value(19,
  'ChingChing',
  'PER',
  124
  );
  insert into city
  value(20,
  'PingPong',
  'PER',
  99
  );
  insert into city
  value(21,
  'Vinterfall',
  'SPN',37
  );
  insert into city
  value(22,
  'KingsLanding',
  'PER',
  95
  );
  insert into city
  value(23,
  'CasterlyRock',
  'USA',
  12
  );

  select count(*) as TotalCities
  from city;
  
  select country.Country_Name, city.Country_Code, city.City_Name from country, city where country.Country_Code= city. Country_Code;