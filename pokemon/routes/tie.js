var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    res.render('tie',
        {
            title: 'Your Guess Result',
            message: "It is a tie!!!"
        });
});

module.exports = router;