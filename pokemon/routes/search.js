var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('search', {
        title: 'Search Result',}); // render a view
}); // use index.ejs as view, also pass additional information, in this case, title: Express

module.exports = router;