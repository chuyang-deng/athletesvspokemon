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
function query_db(res, aname) {
  //var aname = "Barbel Wockel";
  var query = "select sport from Athletes where name = '" + aname + "'";
  connection.query(query, function(err, rows, fields) {
    if (err) console.log(err);
    else if (rows.length == 0){
      connection.query("SET @rank = 0");
      connection.query("SET @sport = (select sport from Athletes where name = \"Kai Zou\")");
      connection.query("SET @athRank = (select rank from (select @rank:=@rank+1 as rank, name from " +
          "(select a.name from Athletes a inner join Medal m on a.name = m.name where a.sport = @sport " +
          "order by m.score DESC) as prerank) as rank where name = \"Kai Zou\")");
      connection.query("SET @athTotal = @rank");
      connection.query("SET @type = (select type from Activities where sport = @sport)");
      connection.query("SET @pokeTotal = (select count(*) from Pokemon where type = @type)");
      connection.query("SET @pokeRank = ceiling(@athRank * (@pokeTotal * 1.0 / @athTotal))");

      connection.query("SET @rank = 0");
      connection.query("select rank2.* from (select @rank:=@rank+1 as rank, prerank2.* from " +
          "(select * from Pokemon where type = @type order by total DESC) as prerank2) " +
          "as rank2 where rank = @pokeRank",
      function(err, rows, fields){
        if (err) console.log(err);
        console.log(rows);
        output_result(res, aname, rows[0]);
      })
    } else {
      var sport = rows[0].sport;
      var query1 = "select type from Activities where sport = '" + sport + "'";
      //console.log(query);
      connection.query(query1, function(err, rows, fields) {
        if (err) console.log(err);
        else{
          var type = rows[0].type;
          var query3 = "select v.name, m.score from "+ sport+ "View v Inner Join Medal m on " +
                              "v.name = m.name ORDER BY m.score DESC";
          //console.log(query3);
          connection.query(query3, function(err, rows, fields) {
            if (err) console.log(err);
            else{
              var athletesRank = rows;
              //console.log(athletesRank);
              var query4 = "Select * From "+ type + "View Order By total DESC";
              connection.query(query4, function(err, rows, fields) {
                if (err) console.log(err);
                else {
                  var PokemonRank = rows;
                  //console.log(PokemonRank);
                  var aRowNum = 0;
                  for (; aRowNum < athletesRank.length; aRowNum++){
                    if (athletesRank[aRowNum].name == aname) break;
                  }
                  //console.log(aRowNum);
                  var pRowNum = aRowNum * ((PokemonRank.length * 1.0) / athletesRank.length);
                  pRowNum = Math.floor(pRowNum);
                  //console.log(PokemonRank[pRowNum]);
                  output_result(res, aname, PokemonRank[pRowNum]);

                }
              })
            }
          })
        }
      })
    }
  });
}

function noResult(res, aname){
  res.render('searchByA', {
    errorMsg: "Athlete: "+ aname+ " is not in our database."
  });
}


// ///
// Given a set of query results, output a table
//
// res = HTTP result object sent back to the client
// name = Name to query for
// results = List object of query results
function output_result(res, aname, result) {
  res.render('resultByA',
      { title: "All Pokemon with type: " + aname,
        result: result
        // result2: result2,
        // result3: result3
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
  query_db(res, req.query.aname);
});

module.exports = router;