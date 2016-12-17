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
  aname = aname.trim();
  var query = "select * from Athletes where name = '" + aname + "'";
  connection.query(query, function(err, rows, fields) {
    if (err) noResult(res, aname);
    else if (rows.length == 0){
      noResult(res, aname);
    } else {
      var athleteAtt = rows[0];
      var sport = rows[0].sport;
      var sportSplit = sport.split(" ");
      var sportView;
      console.log(sportSplit);
      if (sportSplit.length > 1){
        sportView = sportSplit[0] + sportSplit[1].toLowerCase();
      }else{
        sportView = sportSplit[0];
      }
      console.log(sportView);
      var query1 = "select type from Activities where sport = '" + sport + "'";
      console.log(query);
      connection.query(query1, function(err, rows, fields) {
        if (err) noResult(res, aname);
        else{
          var type = rows[0].type;
          var query3 = "select v.name, m.gold, m.silver, m.bronze, m.score from "+ sportView+ "View v Inner Join Medal m on " +
                              "v.name = m.name ORDER BY m.score DESC";
          console.log(query3);
          connection.query(query3, function(err, rows, fields) {
            if (err) noResult(res, aname);
            else{
              var athletesRank = rows;
              console.log(athletesRank);
              var query4 = "Select * From "+ type + "View Order By total DESC";
              connection.query(query4, function(err, rows, fields) {
                if (err) noResult(res, aname);
                else {
                  var PokemonRank = rows;
                  var aRowNum = 0;
                  for (; aRowNum < athletesRank.length; aRowNum++){
                    if (athletesRank[aRowNum].name == aname) break;
                  }
                  console.log(aRowNum);
                  var pRowNum = aRowNum * ((PokemonRank.length * 1.0) / athletesRank.length);
                  pRowNum = Math.floor(pRowNum);
                  console.log(pRowNum);
                  console.log(PokemonRank[pRowNum]);
                  if (pRowNum >= PokemonRank.length || pRowNum < 0){
                    noResult(res, aname);
                  }
                    output_result(res, aname, PokemonRank[pRowNum], athleteAtt, athletesRank[aRowNum]);

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
function output_result(res, aname, result, athleteAtt, medal) {
  res.render('resultByA',
      { title: "All Pokemon with type: " + aname,
        result: result,
        name: aname,
        athleteAtt: athleteAtt,
        medal: medal
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