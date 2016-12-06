var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    res.render('win',
        {
            title: 'Your Guess Result',
            message: "You WIN!!!"
        });
});

module.exports = router;