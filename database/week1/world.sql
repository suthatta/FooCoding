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
  Country_Continent ENUM('Asia','Africa','Antarctica','Australia', 'Europe','North America','South America') NOT NULL DEFAULT 'Europe',
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
  value('ABW','Aruba','North America','Caribbean',
  0
  );
  insert into country
  value
  ('ANT',
  'Netherlands Antilles',
  'North America',
  'Caribbean',
  0
  );
  insert into country
  value
  ('ARE',
  'United Arab Emirates',
  'Asia',
  'Middle East',
  0
  );
  insert into country
  value('ARG',
  'Argentina',
  'South America',
  'South America',
  3
  );
  insert into country
  value('ARM',
  'Armenia',
  'Asia',
  'Middle East',
  0
  );
  insert into country
  value
  ('USA',
  'United States',
  'North America',
  'North America',
  8
  );
  insert into country
  value('THA',
  'Thailand',
  'Asia',
  'Southeast Asia',
  0
  );
  insert into country
  value('SWE',
  'Sweden',
  'Europe',
  'Nordic Countries',
  0
  );
  insert into country
  value('DNK',
  'Denmark',
  'Europe',
  'Nordic Countries',
  0
  );
  insert into country
  value('PHL',
  'Philippines',
  'Asia',
  'Southeast Asia',
  2
  );
  insert into country
  value('IND',
  'India',
  'Asia',
  'Southern and Central Asia',
  0
  );
  insert into country
  value('ESP',
  'Spain',
  'Europe',
  'Southern Europe',
  0
  );
  insert into country
  value('TUR',
  'Turkey',
  'Asia',
  'Middle East',
  0
  );
  insert into country
  value('CHN',
  'China',
  'Asia',
  'Eastern Asia',
  8
  );
  insert into country
  value('PER',
  'Peru',
  'South America',
  'South America',
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
  'Nonthaburi',
  'THA',
  100
  );
  insert into city
  value
  (3,
  'Nakhon Ratchasima',
  'THA',
  400
  );
  insert into city
  value(4,
  'Chiang Mai',
  'THA',
  100
  );
  insert into city
  value(5,
  'Udon Thani',
  'THA',
  158
  );
  insert into city
  value(6,
  'Hat Yai',
  'THA',
  632
  );
  insert into city
  value(7,
  'Khon Kaen',
  'THA',
  500
  );
  insert into city
  value(8,
  'Pak Kret',
  'THA',
  126
  );
  insert into city
  value(9,
  'Nakhon Sawan',
  'THA',
  800
  );
  insert into city
  value(10,
  'Ubon Ratchathani',
  'THA',
  100
  );
  insert into city
  value(11,
  'Songkhla',
  'THA',
  900
  );
  insert into city
  value(12,
  'Nakhon Pathom',
  'THA',
  100
  );
  insert into city
  value(13,
  'Stockholm',
  'SWE',
  748
  );
  insert into city
  value(14,
  'Gothenburg',
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
  'Uppsala',
  'SWE',
  569
  );
  insert into city
  value(17,
  'Linkoping',
  'SWE',
  68
  );
  insert into city
  value(18,
  'Vasterland',
  'SWE',
  28
  );
  insert into city
  value(19,
  'O–rebro',
  'SWE',
  124
  );
  insert into city
  value(20,
  'Norrkoping',
  'SWE',
  99
  );
  insert into city
  value(21,
  'Helsingborg',
  'SWE',37
  );
  insert into city
  value(22,
  'Jonkoping',
  'SWE',
  95
  );
  insert into city
  value(23,
  'UmeAy',
  'SWE',
  12
  );
  insert into city
  value(24,
  'Lund',
  'SWE',
  48
  );
  insert into city
  value(25,
  'Borals',
  'SWE',88
  );
  insert into city
  value(26,
  'Sundsvall',
  'SWE',
  26
  );
  insert into city
  value(27,
  'Gavle',
  'SWE',
  42
  );

  select count(*) as TotalCities
  from city;