from flask import request, jsonify, session
from app.app import db
from passlib.hash import pbkdf2_sha256
from functools import wraps
from Users.user_schema import profile_schema
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

        if db.Users.find_one({'email': user['email']}):
            return {'error': 'email already in use'}, 400

        if db.Users.insert_one(user):
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

        return {'error': 'Invalid credentials'}, 400

    def signOut(self):
        session.clear()
        return {'message': 'Successfully signed out'}, 200

    def profile(self,userId):
        if (request.method=="GET"):
            data = db.Users.find_one({'_id': userId})
            return data
        if (request.method=="PATCH"):
            data = request.json
            data.pop('token', None)
            try:
                errors = profile_schema.validate(data)
                if (errors):
                    return {"message": "Invalid data entered"},500
                db.Users.update_one({'_id' : userId}, {'$set': data})
                return {"message": "Profile updated successfully"},200
            except:
                return {'error': 'Update failed'}, 400




def checkJWT(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        try:
            token = request.json['token']
            data = jwt.decode(token,os.environ.get('JWT_SECRET'))
            return f(*args,**kwargs,userId=data['_id'])
        except:
            return {'error': 'Please sign in again'}, 400

    return wrap