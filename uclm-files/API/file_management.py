from flask import Flask, request, jsonify
from flask_restful import Resource, Api
import requests

import os, json
import urllib3
urllib3.disable_warnings()

DB_PATH = "db"

class File_Management(Resource):

    def get(self, username, doc_id):

        base_url = "db/{}".format(doc_id)

        #check if file exists
        if not os.path.exists(base_url):
            return "File not found", 404

        f = open(base_url,'r')
        content = f.read()

        f.close()

        return content
