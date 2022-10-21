from flask import request, redirect
from flask_restful import Resource

import requests
import urllib3
import json
urllib3.disable_warnings()

class File_Management(Resource):

    def get(self, doc_id):
        if doc_id == "1" or doc_id == "2":
            r = requests.get("http://10.0.2.4/{}".format(doc_id))
            return r.text
        else:
           return "Unauthorized", 401
