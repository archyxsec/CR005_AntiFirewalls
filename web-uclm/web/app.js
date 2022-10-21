//jshint esversion:6
const express = require("express");
const bodyParser = require("body-parser");
var requestify = require('requestify');
const https = require("https");
const ejs = require("ejs");

const app = express();
app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({
  extended: true
}));

app.use(express.static("public"));


app.get("/login", function(req, res) {
  res.render("login");
});

app.post('/login', function (req, res) {
  //var options = {
  //		url: 'http://10.0.2.3/login',
  //		method: 'POST',
  //		body: req.body,
  //		json: true,
  //		headers: {
  //  		'Content-Type': 'application/json'
  //		}
//	}

  //	request(options).then(function(response){
    	// Print out the response body
        // console.log(body)
  		//console.log(response.statusCode);
   //     res.render("dashboard");
//	})
//	.catch(function(err){
//		console.log(err);
//	})

	requestify.post('http://10.0.2.3/login',{
		email: req.body.email,
		password: req.body.passwd
	})
	.then(function(response){

		res.render("dashboard");
	})
	.fail(function(response){
		console.log(response.getCode());
	})

});

app.get('/files', function (req, res) {
	// example get file
	requestify.get('http://10.0.2.4/1').then(function(response){
		response.getBody();
	});
});

app.listen(3000, function() {
  console.log("Server started on port 3000");
});
