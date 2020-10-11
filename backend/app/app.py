from flask import Flask, request
from flask_pymongo import pymongo
import os

MONGO_URL = os.environ.get('DB_URL')

app = Flask(__name__)
app.secret_key = os.environ.get('APP_SECRET')
client = pymongo.MongoClient(MONGO_URL)
db = client.speech_connect

from Users import routes
from Users.model import checkJWT

@app.route("/")
@checkJWT
def hello(userId):
	return "Hello World!"



