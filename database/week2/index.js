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

// simple query
db.query(
  'SELECT * FROM `country` WHERE `Name` = "denmark"',
  function (err, results) {
    console.log('\n Result from country Denmark: ', results); // results contains rows returned by server
    //console.log(fields); // fields contains extra meta data about results, if available
  }
);
//Select all country and name order by Continent Limit 20country;
app.get('/getpost/', (req, res) => {
  let sql = `SELECT Code, Name, Continent FROM country ORDER BY Continent Limit 20;`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send('Post fetched...');
  });
});
//question 1 What is the capital of country X ? (Accept X from user)

app.get('/getpost/:name', (req, res) => {
  let sql = `SELECT * FROM country WHERE Name ="${req.params.name}"`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send('Post fetched')
  })
})

app.get('/getpostname/:name', (req, res) => {
  let sql = `SELECT Capital FROM country WHERE LOWER(Name) LIKE "${req.params.name}"`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send('Post fetched')
  })
})



db.query(
  'SELECT `Capital` FROM `country` WHERE LOWER(`Name`) LIKE ?',
  ['netherlands'],
  function (err, result) {
    console.log('\n Netherlands capital : ', result);
  }
);


// Select single post
app.get('/getpostcode/:code', (req, res) => {
  console.log('get code=', code);
  let sql = `SELECT Code, Name, Capital FROM country WHERE LOWER(Code) LIKE "${req.params.code}"`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send('Post fetched...');
  });
});
//


// with placeholder
db.query(
  'SELECT Name, Region, Continent FROM `country` WHERE `Name` = ?',
  ['Sweden'],
  function (err, results) {
    console.log('\n Select * From Sweden: ', results);
  }
);


//listening port
app.listen('3000', () => {
  console.log('Server started on port 3000:');
})