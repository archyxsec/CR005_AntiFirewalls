//jshint esversion:6
const express = require("express");
const bodyParser = require("body-parser");
const request = require("request");
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
var options = {
    url: 'http://10.0.2.3/login',
    method: 'POST',
    headers: {
        'Content-Type': 'application/json'
    },

    const email = req.body.email;
    const password = req.body.password;
    const data = {
        email: email,
        password: password
        }

  const  jsonData = JSON.stringify(data);
  request(options, function (error, response, body) {
      if (!error) {
          // Print out the response body
          // console.log(body)
          console.log(response.statusCode);
          res.render("dashboard");
      } else {
          console.log(error);
      }
  });
  request.write(jsonData);
  request.end();

};





app.listen(3000, function() {
  console.log("Server started on port 3000");
});
