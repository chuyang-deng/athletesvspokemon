var express = require('express');
var router = express.Router();

<<<<<<< HEAD
/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('allPokemon', {
        title: 'Pokemons'}); // render a view
}); // use index.ejs as view, also pass additional information, in this case, title: Express
=======
var mysql = require('mysql');

var settings = require('../settings.json');
var connection = mysql.createConnection({
  host: settings.address,
  user: settings.user,
  password: settings.password,
  database: settings.database
})


/////
// Query the oracle database, and call output_actors on the results
//
// res = HTTP result object sent back to the client
// name = Name to query for
function query_db(res) {
  var query = "select * from PokemonFull Order By image_no";
  connection.query(query, function(err, rows, fields) {
    if (err) console.log(err);
    else {
      output_result(res, rows);
    }
  });
}

// ///
// Given a set of query results, output a table
//
// res = HTTP result object sent back to the client
// name = Name to query for
// results = List object of query results
function output_result(res, result) {
  res.render('allPokemon',
      { title: "All Pokemon",
        result: result
        // result2: result2,
        // result3: result3
      }
  );
  //console.log(results)
}


// This was a bug in the parameter I passed into the function below
router.get('/', function(req, res) {
  query_db(res);
});
>>>>>>> 74454cd96f801df52c8dcc682facf8e5ad0444d8

module.exports = router;