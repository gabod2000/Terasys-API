config = require('./config');
const fs = require('fs');

var express = require('express');
var app = express();

var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

var mongoose = require('mongoose');

mongoose.Promise = global.Promise;
mongoose.connect(config.mongodb.host);

var router = express.Router();
app.use(router);

require('./prototypes');
require('./routes/route.main.js')(router);

app.listen(config.port).on('listening', function(){
    console.log('Listening https port '+config.port)
});