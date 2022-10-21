#!/usr/bin/env python3

from flask import Flask, request, jsonify
from flask_restful import Resource, Api

import login
import file_management

version = "0.1"
app = Flask(__name__)
api = Api(app)

class Version(Resource):
    def get(self):
        return {'version' : version}

api.add_resource(Version, '/version')
api.add_resource(login.Login,'/login')
api.add_resource(file_management.File_Management, '/<string:doc_id>')

if __name__ == '__main__':
     app.run(debug=True,host='0.0.0.0',port='80')
