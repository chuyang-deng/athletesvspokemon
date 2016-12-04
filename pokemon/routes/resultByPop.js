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


/////
// Query the oracle database, and call output_actors on the results
//
// res = HTTP result object sent back to the client
// name = Name to query for
function query_db(res, pname) {
  var query = "select * from Pokemon p where p.type = '" + pname + "'";
  connection.query(query, function(err, rows, fields) {
    if (err) console.log(err);
    else {
      var result1 = rows;
      var query1 = "select * from Activities a where a.type = '" + result1[0].type + "'";
      console.log(query);
      connection.query(query1, function(err, rows, fields) {
        if (err) console.log(err);
        else{
          var result2 = rows;
          var query3 = "select * from Athletes a where a.sport = '" + result2[0].sport + "'";
          console.log(query3);
          connection.query(query3, function(err, rows, fields) {
            if (err) console.log(err);
            else{
              var result3 = rows;
              output_persons(res, pname, result1, result2, result3);
            }
          })
        }
      })
    }
  });
}

// ///
// Given a set of query results, output a table
//
// res = HTTP result object sent back to the client
// name = Name to query for
// results = List object of query results
function output_persons(res, pname, result1,result2,result3) {
  res.render('resultByPop',
      { title: "All Pokemon with type: " + pname,
        result1: result1,
        result2: result2,
        result3: result3
      }
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