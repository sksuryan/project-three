from flask import request, jsonify
from Events.schema import event_creation_schema
from Topics.model import Topics
from app.app import db
import uuid

class Events:
    def getEvent(self):
        try:
            eventId = request.json['_id']
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
            data['createdBy'] = userId
            organizer = db.organisers.find_one({'_id': userId})
            if not errors and organizer:
                db.events.insert_one(data)

                del organizer['password']
                del organizer['_id']
                del organizer['email']
                if 'events' not in organizer.keys():
                    organizer['events'] = []
                organizer['events'].append(data['_id'])

                db.organisers.update_one({'_id': userId},{'$set': organizer})

                topics = data['topics']
                for i in topics:
                    Topics().addEvent(topicId=i['_id'],EventId=data['_id'])

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

            event = db.events.find_one({'_id': eventId})
            topics = event['topics']
            if not errors and event['createdBy'] == userId:
                update = db.events.update_one({'_id': eventId}, {'$set': data})
                if update.matched_count > 0:

                    for i in topics:
                        Topics().removeEvent(topicId=i['_id'],EventId=eventId)

                    topics = data['topics']
                    for i in topics:
                        Topics().addEvent(topicId=i['_id'],EventId=eventId)
                    return jsonify({'message': 'success'}), 200
                else:
                    return jsonify({'error': 'Couldn\'t update the event'}), 400
            else:
                return jsonify({'error': 'Oopsie: Issue with request or you don\'t have permission.'}), 400
        except:
            return jsonify({'error': 'Something wrong with the request'}), 400

    def deleteEvent(self,userId):
        try:
            data = request.json
            del data['token']
            eventId = data['_id']

            event = db.events.find_one({'_id': eventId})
            
            if event['createdBy'] == userId:

                organizer = db.organisers.find_one({'_id': userId})
                events = organizer['events']
                events.remove(eventId)
                db.organisers.update_one({'_id': userId},{'$set': {'events': events}})

                db.events.delete_one({'_id': eventId})

                topics = event['topics']
                for i in topics:
                        Topics().removeEvent(topicId=i['_id'],EventId=eventId)

                return jsonify({'message': 'successfully deleted the event'}), 200
            else:
                return jsonify({'error': 'Oopsie: Issue with request or you don\'t have permission.'}), 400
        except:
            return jsonify({'error': 'Something wrong with the request'}), 400

    def feed(self,userId):
        try:
            user = db.Users.find_one({'_id': userId})
            if user:
                topics = user['topics']
                print(topics)
                eventIds = set()
                for i in topics:
                    eventIds.update(Topics().getEventIdsFromTopic(topicId=i['_id']))
                eventIds = list(eventIds)
                events = []
                for i in eventIds:
                    events.append(self.getEventFromId(eventId=i))
                return jsonify(events), 200
        except:
            raise
            return jsonify({'error': 'Something went wrong'}), 400

    def getEventFromId(self,eventId):
        event = db.events.find_one({'_id': eventId})
        return event