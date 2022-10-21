#!/usr/bin/env python3

from flask import Flask, request, jsonify
from flask_restful import Resource, Api

import file_management

app = Flask(__name__)
api = Api(app)

api.add_resource(file_management.File_Management, '/<string:doc_id>')

if __name__ == '__main__':
     app.run(debug=True,host='0.0.0.0',port='80')
