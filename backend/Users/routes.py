from flask import Flask, request
from app.app import app
from Users.model import User

@app.route("/auth/signup/",methods=['POST'])
def signup():
    return User().signUp()

@app.route("/auth/login/",methods=['POST'])
def login():
    return User().login()

@app.route("/auth/signout/",methods=['POST'])
def signOut():
    return User().signOut()