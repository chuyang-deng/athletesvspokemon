var express = require('express');
var router = express.Router();

var mysql = require('mysql');
var connection = mysql.createConnection({
  host: 'cisproject.cguwhx0yelq2.us-west-2.rds.amazonaws.com',
  user: 'cisproject',
  password: 'DCYLNZY32',
  database: 'CISPROJECT'
})



/////
// Query the oracle database, and call output_actors on the results
//
// res = HTTP result object sent back to the client
// name = Name to query for
function query_db(res, pname) {
  query = "select * from Pokemon p where p.type = '" + pname + "'";
  connection.query(query, function(err, rows, fields) {
    if (err) console.log(err);
    else {
      output_persons(res, pname, rows);
    }
  });
}

// ///
// Given a set of query results, output a table
//
// res = HTTP result object sent back to the client
// name = Name to query for
// results = List object of query results
function output_persons(res, pname, results) {
  res.render('search',
      { title: "All Pokemon with type: " + pname,
        results: results }
  );
  //console.log(results)
}

/////
// This is what's called by the main app
// exports.do_work = function(req, res){
//   query_db(res,req.query.name);
// };

// /* GET home page. */
// router.get('/', function(req, res, next) {
//     res.render('search', {
//         title: 'Search Result',}); // render a view
// });

// This was a bug in the parameter I passed into the function below
router.get('/', function(req, res, next) {
  query_db(res, req.query.pname);
});

module.exports = router;