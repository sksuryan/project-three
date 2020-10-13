from flask import request
from app.app import app
from Users.model import checkJWT
from Events.model import Events

@app.route("/event",methods = ['GET','POST','PATCH','DELETE'])
@checkJWT
def events(userId):
    method = request.method
    if method == 'GET':
        return Events().getEvent()
    elif method == 'POST':
        return Events().postEvent(userId)
    elif method == 'PATCH':
        return Events().patchEvent(userId)
    else:
        return Events().deleteEvent(userId)

# @app.route('/feed', method = ['GET']):
# @checkJWT
# def feed(userId):
    
