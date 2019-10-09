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

show tables;

drop table if exists city;
create table city
(
  City_Code int(11) NOT NULL
  AUTO_INCREMENT,
  City_Name varchar
  (35) NOT NULL DEFAULT '', 
  Country_Code varchar
  (3) NOT NULL DEFAULT '',
  City_Population int
  (11) NOT NULL DEFAULT 0,
  primary key
  (City_Code),
  foreign key
  (Country_Code) REFERENCES country
  (Country_Code)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

show tables;
  /*insert into country (Country_Code,Country_Name,Continent,Region,Capital, Population)  Values*/
  insert into country
  value('001','Singapo','Asia','Caribbean',
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
  ('002',
  'India',
  'Asia',
  'Middle East',
  0
  );
  insert into country
  value('003',
  'Argentina',
  'SouthAmerica',
  'SouthAmerica',
  3
  );
  insert into country
  value('004',
  'Turkey',
  'Europe',
  'Middle East',
  0
  );
  insert into country
  value
  ('005',
  'United States',
  'NorthAmerica',
  'NorthAmerica',
  8
  );
  insert into country
  value('006',
  'Thailand',
  'Asia',
  'Asia',
  0
  );
  insert into country
  value('007',
  'Sweden',
  'Europe',
  'NordicCountries',
  0
  );
  insert into country
  value('008',
  'Denmark',
  'Europe',
  'NordicCountries',
  0
  );
  insert into country
  value('009',
  'Philippines',
  'Asia',
  'SoutheastAsia',
  2
  );
  insert into country
  value('010',
  'Los',
  'Asia',
  'SouthernAsia',
  0
  );
  insert into country
  value('011',
  'Spain',
  'Europe',
  'Southern Europe',
  0
  );
  insert into country
  value('012',
  'Cannada',
  'SouthAmerica',
  'MiddleEast',
  0
  );
  insert into country
  value('013',
  'China',
  'Asia',
  'EasternAsia',
  8
  );
  insert into country
  value('014',
  'Peru',
  'SouthAmerica',
  'SouthAmerica',
  0
  );

  select count(*) as TotalCountries
  from country;

  /*insert into city   values (City_code,City_Name,Country_Code,City_Population)*/
  <<<<<<< HEAD
  insert into city
  value
  (1,
  'Bangkok',
  '001',
  60
  );
  insert into city
  value
  (2,
  'Azabajan',
  '002',
  100
  );
  insert into city
  value
  (3,
  'AroiDee',
  '003',
  400
  );
  insert into city
  value(4,
  'ChiangMai',
  '004',
  100
  );
  insert into city
  value(5,
  'Udon',
  '005',
  158
  );

  insert into city
  value(9,
  'WhiteHarbor',
  '006',
  800
  );
  insert into city
  value(13,
  'Stockholm',
  '007',
  748
  );
  insert into city
  value(14,
  'Mantarys',
  '008',
  90
  );
  insert into city
  value(15,
  'Malmo',
  '007',
  79
  );
  insert into city
  value(16,
  'KingInTheNorr',
  '009',
  569
  );
  insert into city
  value(17,
  'Landstring',
  '010',
  68
  );
  insert into city
  value(18,
  'Vasterland',
  '011',
  28
  );
  insert into city
  value(19,
  'ChingChing',
  '012',
  124
  );
  insert into city
  value(20,
  'PingPong',
  '013',
  99
  );
  insert into city
  value(21,
  'Vinterfall',
  '014',37
  );
  insert into city
  value(22,
  'KingsLanding',
  '001',
  95
  );
  insert into city
  value(23,
  'CasterlyRock',
  '002',
  12
  );

  select count(*) as TotalCities
  from city;

  select country.Country_Name, city.Country_Code, city.City_Name
  from country, city
  where country.Country_Code= city. Country_Code
  order by Country_Code;

 
