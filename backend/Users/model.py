from flask import request, jsonify, session
from app.app import db
from passlib.hash import pbkdf2_sha256
from functools import wraps
from Users.user_schema import user_profile_schema,org_profile_schema
from Topics.model import Topics
from Events.model import Events
import uuid
import jwt
import  os

class User:
    def startSession(self,user):
        del user['password']
        session['loggedIn'] = True
        session['user'] = user

        token = jwt.encode({'_id': user['_id']},os.environ.get('JWT_SECRET'))

        return jsonify({'token': token.decode('UTF-8')}), 200

    def signUp(self):
        user = {
            '_id': uuid.uuid4().hex,
            'name': request.json['name'],
            'email': request.json['email'],
            'password': request.json['password'],
            'speaker': request.json['isSpeaker'],
        }

        user['password'] = pbkdf2_sha256.encrypt(user['password'])

        if db.Users.find_one({'email': user['email']}) or db.organisers.find_one({'email': user['email']}):
            return {'error': 'email already in use'}, 400
        if user["speaker"]:
            if db.Users.insert_one(user):
                return self.startSession(user)
        else:
            if db.organisers.insert_one(user):
                return self.startSession(user)

        return {'error': 'Failed to signup'}, 400

    def login(self):
        user = {
            'email': request.json['email'],
            'password': request.json['password']
        }

        data = db.Users.find_one({'email': user['email']})
        if data and pbkdf2_sha256.verify(user['password'],data['password']):
            return self.startSession(data)
        
        org_data = db.organisers.find_one({'email': user['email']})
        if org_data and pbkdf2_sha256.verify(user['password'],org_data['password']):
            return self.startSession(org_data)

        return {'error': 'Invalid credentials'}, 400

    def signOut(self):
        session.clear()
        return {'message': 'Successfully signed out'}, 200

    def profile(self,userId):
        if (request.method=="GET"):
            data = db.Users.find_one({'_id': userId})
            if (data):
                del data['password']
                return data
            org_data = db.organisers.find_one({'_id': userId})
            if (org_data):
                del org_data['password']
                return org_data

        if (request.method=="PATCH"):
            data = request.json
            data.pop('token', None)
            try:
                user_errors = user_profile_schema.validate(data)
                org_errors = org_profile_schema.validate(data)
                if (user_errors and org_errors):
                    return {"message": "Invalid data entered"},500
                if (org_errors):
                    user = db.Users.find_one({'_id': userId})
                    update = db.Users.update_one({'_id' : userId}, {'$set': data})
                    if update.matched_count > 0:
                        topics = user['topics']
                        for i in topics:
                            Topics().removeUser(topicId=i['_id'],UserId=userId)
                        topics = data['topics']
                        for i in topics:
                            Topics().addUser(topicId=i['_id'],UserId=userId)
                        return {"message": "Profile updated successfully"},200
                    else:
                        return {"message": "Invalid data entered"},500
                else:
                    data = db.organisers.update_one({'_id' : userId}, {'$set': data})
                    if data.matched_count > 0:
                        return {"message": "Profile updated successfully"},200
                    else:
                        return {"message": "Invalid data entered"},500
            except:
                return {'error': 'Update failed'}, 400

    def apply_event(self,userId):
        if (request.method=="POST"):
            user_data = db.Users.find_one({"_id":userId})
            event_id = request.json['event_id']
            if (user_data):
                event = Events().getEventFromId(event_id)
                if db.applications.insert_one({
                    "user_id":userId,
                    "event_id":event_id,
                    "event_name":event["name"],
                    "organisers_id":event["createdBy"],
                    "topics": event["topics"],
                    "on_location":event["on_location"]
                    }):
                    return {"message": "Applied successfully"},200
        else:
            data = db.applications.find({"organisers_id": userId})
            print (data.json())
            return jsonify(list(data)), 200

def checkJWT(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        try:
            token = request.headers['token']
            data = jwt.decode(token,os.environ.get('JWT_SECRET'))
            return f(*args,**kwargs,userId=data['_id'])
        except:
            return {'error': 'Please sign in again'}, 400

    return wrap
