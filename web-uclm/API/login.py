from flask import request, redirect
from flask_restful import Resource
import requests, json

class Login(Resource):
    def get(self):
        username = request.args['email'] 
        password = request.args['password']

        if not username or not password:
            return "Bad request", 400
        else:
            response = self.check_login(username, password)
            if "incorrect" in response:
                return 'Username or password are incorrect', 401
            else:
                return response



    def check_login(self, username, password):
        r = requests.get("http://10.0.2.3/login?email={}&password={}".format(username, password))
        return json.loads(r.text)
