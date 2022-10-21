from flask import Flask, request, jsonify
from flask_restful import Resource, Api

import bcrypt
import hashlib
import base64
import tokens
import json

USERS_FILE = "users/users.json"

class Login(Resource):
    def post(self):

        username = request.args['email']
        password = request.args['password']

        if self.check_username_and_password(username, password):
            return "OK", 200

        else:
            return 'Username or password are incorrect', 401


    def check_username_and_password(self, user, password):
        users_file = open(USERS_FILE,'r')
        content = json.load(users_file)
        result = False
        for user in content:
            if content[user] == password:
                result = True
                break

        return result

