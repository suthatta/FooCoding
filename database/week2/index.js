// get the client
const express = require('express')
const mysql = require('mysql');


// create the connection to database

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'suthatta123',
  database: 'new_world'
});

/*Create a database named "mydb":*/
db.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
  //Create a database named "mydb":
  /* db.query("CREATE DATABASE test IF NOT EXISTS", function (err, result) {
     if (err) throw err;
     console.log("Database created");
   });*/
});

const app = express();
//create db
app.get('/createDB', (req, res) => {
  let sql = 'CREATE DATABASE test2';
  db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send('Database created...');
  });
});
// question 1
db.query(
  'SELECT DISTINCT `Capital` FROM `country` WHERE LOWER(`Name`) LIKE ?',
  ['netherlands'],
  function (err, result) {
    console.log('\n Netherlands capital : ', result);
  }
);

//2 List all the languages spoken in the region Y (Accept Y from user)
/*select count(Region), Region from country group by Region;
 select Language, Region from countrylanguage c inner join country co on co.Code =c.CountryCode where lower(Region) LIKE "North %";*/

db.query(
  'select Language, Region from countrylanguage c inner join country co on co.Code =c.CountryCode where lower(Region) LIKE ?',
  ['north%'],
  function (err, result) {
    console.log('\n QUESTION 2: Language from Region : ', result);
  }
);

//3 Find the number of cities in which language Z is spoken (Accept Z from user)

db.query(
  'select count(1) from city ci inner join countrylanguage c on c.CountryCode = ci.CountryCode where lower(Language) LIKE ?',
  ['swedish'],
  function (err, result) {
    console.log('\n QUESTION 3: the number of cities Spoke : ', result);
  }
);
//4 List all the continents with the number of languages spoken in each continent
db.query(
  'select continent, count(language) as languages from country c inner join countrylanguage co on c.Code = co.CountryCode group by continent',
  function (err, result) {
    console.log('\n QUESTION 4: List all continents : ', result);
  }
);
// 5 Are there any countries that have A) Same official language B) Same region If yes, 
//display those countries.If no, display TRUE or FALSE
db.query(
  'select Name, Region, Language from country c inner join countrylanguage co ',
  'on c.Code = co.CountryCode where IsOfficial = "T" order by Region, Language',
  function (err, result) {
    console.log('\n QUESTION 5: Country in The same Region and Same Language \n: ', result);
  }
);