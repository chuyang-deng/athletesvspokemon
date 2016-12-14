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
/**
 * Get 2 random tuples from pokemon table
 */

function query_random_pokemon(res) {
    var query = "SELECT distinct name, image_no, total FROM PokemonFull ORDER BY RAND() LIMIT 20";
    connection.query(query, function(err, rows, fileds) {
        if (err) console.log(err);
        else output_result(res, rows);
    });
}

function output_result(res, result) {
    res.render('guessgame',
        {
            title: 'Guess Who Will Win the Battle!',
            result: result
        });
}

/* GET home page. */
router.get('/', function(req, res) {
    query_random_pokemon(res); // render the query result
}); // use index.ejs as view, also pass additional information, in this case, title: Express

module.exports = router;