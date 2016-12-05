var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('allAthletes', { title: 'Athletes VS Pokemon' });
});

module.exports = router;