from flask import Flask, request
from flask_pymongo import pymongo
from .config import DB_URL

MONGO_URL = DB_URL

app = Flask(__name__)
client = pymongo.MongoClient(MONGO_URL)
db = client.speech_connect

from Users import routes

@app.route("/")
def hello():
	return "Hello World!"

