var express = require('express');
var router = express.Router();
var mongodb = require('mongodb');
var mysql = require('mysql');

var settings = require('../settings.json');

var connection = mysql.createConnection({
    host: settings.address,
    user: settings.user,
    password: settings.password,
    database: settings.database
})

var MongoClient = mongodb.MongoClient;
var uri = "mongodb://chuyang:xiaogougou4250@ds127928.mlab.com:27928/popularity";

var popularityA;
var popularityP;
var rank = -1;
var pokemon;

function mongoQuery(res, aname) {

    MongoClient.connect(uri, aname, function(err, db) {
        if (err) {
            console.log("Failed to connect to MongoDB.");
            noResult(res,aname);
        } else {
            console.log("Successfully connected to MongoDB.");

            var collectionAthletes = db.collection('athletes');
            collectionAthletes.find({Name: aname}).toArray(function (err, result) {
                if (err) {
                    //res.send(err);
                    noResult(res,aname);
                } else if (result.length) {
                    /* Get athlete's popularity */
                    console.log("Connected to Athletes collection.");

                    popularityA = result[0]["Popularity"];
                    rank = result[0]["Rank"];
                    console.log('Popularity: ', popularityA, 'Rank: ', rank);

                    var collectionPokemon = db.collection('pokemon');
                    collectionPokemon.find({}).sort({Popularity: -1}).toArray(function (err, result) {
                        if (err) {
                          noResult(res,aname);
                        } else if (result.length) {
                            /* Find corresponding pokemon according to popularity rank */
                          console.log("Connected to Pokemon collection.");
                          console.log(result.length);
                          console.log(rank);
                          if (rank != -1){
                            pokemon = result[rank]["Name"];
                            popularityP = result[rank]["Popularity"]
                            console.log("Popular Pokemon: ", pokemon);

                            sqlQuery(res, pokemon, aname);

                            db.close();
                          }else{
                            noResult(res, aname);
                          }
                        } else {
                          noResult(res,aname);
                        }
                    });

                } else {
                    //res.send("Athlete is not in our record.");
                    noResult(res,aname);
                }
            });


        }
    });
}

function noResult(res, aname){
  res.render('searchByPop', {
    errorMsg: "Athlete: "+ aname+ " is not in this database."
  });
}

function sqlQuery(res, pokemon, aname) {

    var query = "SELECT image_no FROM PokemonFull WHERE name = '" + pokemon + "'";
    connection.query(query, function(err, rows) {
        if (err) {
            noResult(res, aname)
        } else if (rows.length) {
            console.log("Found pokemon in MySQL with image_no: ", rows[0].image_no);

            res.render('resultByPop', {
                athlete: aname,
                pokemon: pokemon,
                result: rows[0].image_no,
                popularityA: popularityA,
                popularityP: popularityP
            });

        } else {
            noResult(res, aname)
        }
    });
}


router.get('/', function(req, res) {
    mongoQuery(res, req.query.aname);
});

module.exports = router;