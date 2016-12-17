var express = require('express');
var router = express.Router();

var mysql = require('mysql');

var settings = require('../settings.json');
var connection = mysql.createConnection({
  host: settings.address,
  user: settings.user,
  password: settings.password,
  database: settings.database
})

function query_db(res) {
  var query = "select * from PokemonFull";
  connection.query(query, function(err, rows, fields) {
    if (err) console.log(err);
    else {
      output_result(res, rows);
    }
  });
}

function output_result(res, result) {
  res.render('allPokemon',
      { title: "All Pokémons",
        result: result
      }
  );
}

router.get('/', function(req, res) {
  query_db(res);
});

module.exports = router;