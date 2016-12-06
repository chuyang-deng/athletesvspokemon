var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    res.render('lose',
        {
            title: 'Your Guess Result',
            message: "You LOST!!!"
        });
});

module.exports = router;