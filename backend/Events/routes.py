from flask import request
from app.app import app
from Users.model import checkJWT
from Events.model import Events

@app.route("/events",methods = ['GET','POST','PATCH'])
@checkJWT
def events(userId):
    method = request.method
    if method == 'GET':
        return Events().getEvent(userId)
    elif method == 'POST':
        return Events().postEvent(userId)
    else:
        return Events().patchEvent(userId)
