#!/usr/bin/env python3

from flask import Flask, request, jsonify
from flask_restful import Resource, Api

import login

app = Flask(__name__)
api = Api(app)

api.add_resource(login.Login, '/login')

if __name__ == '__main__':
     app.run(debug=True,host='0.0.0.0',port='80')
