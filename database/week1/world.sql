create database world;
use world;
show tables;
drop table country;
drop table city;

create table country
(
  Country_Code varchar(3) NOT NULL DEFAULT '',
  Country_Name varchar(30) NOT NULL DEFAULT '',
  Country_Continent ENUM('Asia','Africa','Antarctica','Australia', 'Europe','North America','South America') NOT NULL DEFAULT 'Europe',
  Country_Region varchar
(25) NOT NULL DEFAULT '',
  Country_Capital int
(11) NOT NULL DEFAULT 0,
Country_Population int
(11) NOT NULL default 0,
  primary key
(Country_Code)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
  value
  ('ABW',
  'Aruba',
  'North America',
  'Caribbean',
  0,
  0
  );
  insert into country
  value
  ('ANT',
  'Netherlands Antilles',
  'North America',
  'Caribbean',
  0,
  0
  );
  insert into country
  value
  ('ARE',
  'United Arab Emirates',
  'Asia',
  'Middle East',
  2,
  0
  );
  insert into country
  value('ARG',
  'Argentina',
  'South America',
  'South America',
  60,
  3
  );
  insert into country
  value('ARM',
  'Armenia',
  'Asia',
  'Middle East',
  80,
  0
  );
  insert into country
  value
  ('USA',
  'United States',
  'North America',
  'North America',
  5,
  8
  );
  insert into country
  value('THA',
  'Thailand',
  'Asia',
  'Southeast Asia',
  9,
  0
  );
  insert into country
  value('SWE',
  'Sweden',
  'Europe',
  'Nordic Countries',
  8,
  0
  );
  insert into country
  value('DNK',
  'Denmark',
  'Europe',
  'Nordic Countries',
  2,
  0
  );
  insert into country
  value('PHL',
  'Philippines',
  'Asia',
  'Southeast Asia',
  3,
  2
  );
  insert into country
  value('IND',
  'India',
  'Asia',
  'Southern and Central Asia',
  5,
  0
  );
  insert into country
  value('ESP',
  'Spain',
  'Europe',
  'Southern Europe',
  5,
  0
  );
  insert into country
  value('TUR',
  'Turkey',
  'Asia',
  'Middle East',
  0,
  0
  );
  insert into country
  value('CHN',
  'China',
  'Asia',
  'Eastern Asia',
  0,
  8
  );
  insert into country
  value('PER',
  'Peru',
  'South America',
  'South America',
  0,
  0
  );


  insert into city
  value
  (1,
  'Bangkok',
  'THA',
  6320174
  );
  /*(City_code,City_Name,Country_Code,City_Population)*/
  (2, 'Nonthaburi', 'THA', 292100),
  (3, 'Nakhon Ratchasima', 'THA', 181400),
  (4, 'Chiang Mai', 'THA', 171100),
  (5, 'Udon Thani', 'THA', 158100),
  (6, 'Hat Yai', 'THA', 148632),
  (7, 'Khon Kaen', 'THA', 126500),
  (8, 'Pak Kret', 'THA', 126055),
  (9, 'Nakhon Sawan', 'THA', 123800),
  (10, 'Ubon Ratchathani', 'THA', 116300),
  (11, 'Songkhla', 'THA', 94900),
  (12, 'Nakhon Pathom', 'THA', 94100),
  (13, 'Stockholm', 'SWE', 750348),
  (14, 'Gothenburg [GÃ¶teborg]', 'SWE', 466990),
  (15, 'MalmÃ¶', 'SWE', 259579),
  (16, 'Uppsala', 'SWE', 189569),
  (17, 'LinkÃ¶ping', 'SWE', 133168),
  (18, 'VÃ¤sterÃ¥s', 'SWE', 126328),
  (19, 'Ã–rebro', 'SWE', 124207),
  (20, 'NorrkÃ¶ping', 'SWE', 122199),
  (21, 'Helsingborg', 'SWE', 117737),
  (22, 'JÃ¶nkÃ¶ping', 'SWE', 117095),
  (23, 'UmeÃ¥', 'SWE', 104512),
  (24, 'Lund', 'SWE', 98948),
  (25, 'BorÃ¥s', 'SWE', 96883),
  (26, 'Sundsvall', 'SWE', 93126),
  (27, 'GÃ¤vle', 'SWE', 90742);