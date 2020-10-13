from flask import Flask, request
from app.app import app
from Users.model import User,checkJWT

@app.route("/auth/signup/",methods=['POST'])
def signup():
    return User().signUp()

@app.route("/auth/login/",methods=['POST'])
def login():
    return User().login()

@app.route("/auth/signout/",methods=['POST'])
def signOut():
    return User().signOut()

@app.route("/profile",methods=['PATCH','GET'])
@checkJWT
def view_profile(userId):
	return User().profile(userId)

@app.route("/applications",methods=['POST','GET'])
@checkJWT
def apply_event(userId):
	return User().apply_event(userId)

