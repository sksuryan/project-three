from flask import request, jsonify
from Events.schema import event_creation_schema
from app.app import db
import uuid

class Events:
    def getEvent(self):
        try:
            eventId = request.json[eventId]
            event = db.events.find_one({'_id': eventId})
            if event:
                return jsonify(event), 200
            else: 
                return jsonify({'error': 'Couldnt find the requested event'}), 400
        except:
            return jsonify({'error': 'Something wrong with the request'}), 400

    def postEvent(self,userId):
        try:
            data = request.json
            del data['token']
            errors = event_creation_schema.validate(data)
            data['_id'] = uuid.uuid4().hex
            print(errors)
            if not errors:
                db.events.insert_one(data)
                return jsonify({'message': 'success', 'data': data}), 200
            else:
                return jsonify({'error': 'Couldn\'t add the event'}), 400
        except:
            return jsonify({'error': 'Something wrong with the request'}), 400

    def patchEvent(self,userId):
        try:
            data = request.json
            del data['token']
            eventId = data['_id']
            del data['_id']
            errors = event_creation_schema.validate(data)
            if not errors:
                update = db.events.update_one({'_id': eventId}, {'$set': data})
                if update.matched_count > 0:
                    return jsonify({'message': 'success'}), 200
                else:
                    return jsonify({'error': 'Couldn\'t update the event'}), 400
            else:
                return jsonify({'error': 'Couldn\'t update the event'}), 400
        except:
            return jsonify({'error': 'Something wrong with the request'}), 400
