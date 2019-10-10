drop database if exists world;
create database
if not exists world;
use world;
show tables;
drop table if exists country;
create table country
(
  Country_Code int(2) NOT NULL
  AUTO_INCREMENT,
  Country_Name varchar
  (30) NOT NULL DEFAULT '',
  Country_Continent ENUM
  ('Asia','Europe','NorthAmerica','SouthAmerica') NOT NULL DEFAULT 'Europe',
  Country_SurfaceArea float
  (10,2) NOT NULL DEFAULT '0.00',
  Country_Population int
  (11) NOT NULL default 0,
  primary key
  (Country_Code)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

show tables;

  drop table if exists city;
  create table city
  (
    City_Code int(2) NOT NULL
    AUTO_INCREMENT,
  City_Name varchar
    (30) NOT NULL DEFAULT '', 
  Country_Code int
    (2) NOT NULL,
  City_Population int
    (11) NOT NULL DEFAULT 0,
  primary key
    (City_Code),
  foreign key
    (Country_Code) REFERENCES country
    (Country_Code) )ENGINE=InnoDB DEFAULT CHARSET=latin1;

show tables;
    /*insert into country (Country_Code,Country_Name,Continent,Region,Capital, Population)  Values*/
    insert into country
    value('001','Singapo','Asia',110,
    5
    );
    insert into country
    value
    ('002',
    'India',
    'Asia',
    10.5,
    5
    );
    insert into country
    value('003',
    'Argentina',
    'SouthAmerica',
    4.5,
    3
    );
    insert into country
    value('004',
    'Turkey',
    'Europe',
    0,
    0
    );
    insert into country
    value
    ('005',
    'United States',
    'NorthAmerica',
    0,
    8
    );
    insert into country
    value('006',
    'Thailand',
    'Asia',
    0,
    0
    );
    insert into country
    value('007',
    'Sweden',
    'Europe',
    21.5,
    8
    );
    insert into country
    value('008',
    'Denmark',
    'Europe',
    10,
    800
    );
    insert into country
    value('009',
    'Philippines',
    'Asia',
    9,
    2
    );
    insert into country
    value('010',
    'Los',
    'Asia',
    40,
    82
    );
    insert into country
    value('011',
    'Spain',
    'Europe',
    6,
    7
    );
    insert into country
    value('012',
    'Cannada',
    'SouthAmerica',
    80,
    4
    );
    insert into country
    value('013',
    'China',
    'Asia',
    90,
    8
    );
    insert into country
    value('014',
    'Peru',
    'SouthAmerica',
    100,
    30
    );

    select count(*) as TotalCountries
    from country;

    /*insert into city   values (City_code,City_Name,Country_Code,City_Population)*/
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

 
