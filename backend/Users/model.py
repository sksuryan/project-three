from flask import request, jsonify

class User:

    def signUp(self):
        user = {
            'name': request.json['name'],
            'email': request.json['email'],
            'password': request.json['password']
        }

        return jsonify(user), 200

    def login(self):
        user = {
            'email': request.json['email'],
            'password': request.json['password']
        }

        return jsonify(user), 200