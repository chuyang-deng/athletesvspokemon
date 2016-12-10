var express = require('express');
var router = express.Router();
var Q = require('q');

var mysql = require('mysql');

var settings = require('../settings.json');
var connection = mysql.createConnection({
  host: settings.address,
  user: settings.user,
  password: settings.password,
  database: settings.database
})
/**
 * Get 2 random tuples FROM pokemon table
 */

function query_random_pokemon(res) {
  var query = "SELECT * FROM Athletes a INNER JOIN Medal m ON a.name = m.name ORDER BY RAND() LIMIT 5";
  connection.query(query, function(err, rows) {
    if (err) console.log(err);
    else {
      var athletes = rows;
      var answers = [];
      var other = [];

      for (var i = 0; i < athletes.length; i++){

        var promises = ['aaa'].map(function(name) {
          return new Promise(function(resolve, reject) {
            getAnswer(rows[i].name, answers, other,resolve);
          });
        });
      }
      Promise.all(promises)
          .then(function() {
              output_result(res, athletes, answers, other);
          })
          .catch(console.error);
    }
  });
}

function getAnswer(name, answers, other,resolve){
  console.log("querying...");
  connection.query("SET @rank = 0");
  connection.query("SET @sport = (SELECT sport FROM Athletes WHERE name = \"" + name +"\")");
  connection.query("SET @athRank = (SELECT rank FROM (SELECT @rank:=@rank+1 AS rank, name FROM " +
      "(SELECT a.name FROM Athletes a INNER JOIN Medal m ON a.name = m.name WHERE a.sport = @sport " +
      "ORDER BY m.score DESC) AS prerank) AS rank WHERE name = \"" + name +"\")");
  connection.query("SET @athTotal = @rank");
  connection.query("SET @type = (SELECT type FROM Activities WHERE sport = @sport)");
  connection.query("SET @pokeTotal = (SELECT count(*) FROM Pokemon WHERE type = @type)");
  connection.query("SET @pokeRank = ceiling(@athRank * (@pokeTotal * 1.0 / @athTotal))");

  connection.query("SET @rank = 0");
  connection.query("SELECT name, total, image_no, type FROM (SELECT @rank:=@rank+1 AS rank, prerank2.* FROM " +
      "(SELECT * FROM Pokemon WHERE type = @type ORDER BY total DESC) AS prerank2) " +
      "as rank2 WHERE rank = @pokeRank",
      function(err, rows){
        if (err) console.log(err);
        else{
          console.log(rows[0].name);
          answers.push(rows[0]);

          var promises = ['aaa'].map(function(name) {
            return new Promise(function(resolve, reject) {
              connection.query("SELECT name, total, image_no, type1 AS type FROM PokemonFull WHERE " +
                  "name <> \"" + rows[0].name + "\" ORDER BY RAND() LIMIT 3", function(err, rows){
                if (err) console.log(err);
                else{
                  other.push(rows[0]);
                  other.push(rows[1]);
                  other.push(rows[2]);
                }
                resolve();
              });
            });
          });

          Promise.all(promises)
              .then(function() {
                resolve();
              })
              .catch(console.error);
        }
      });
}

function output_result(res, athletes, answers, other) {
  console.log(athletes);
  console.log(answers);
  console.log(other);
  res.render('matchGame',
      {
        title: 'Guess Who Will Win the Battle',
        athletes: athletes,
        answers: answers,
        other: other
      });
}

/* GET home page. */
router.get('/', function(req, res) {
  query_random_pokemon(res); // render the query result
}); // use index.ejs as view, also pass additional information, in this case, title: Express

module.exports = router;