from flask import request, jsonify
from app.app import db

class Topics:
    def getTopics(self):
        data = db.topics.find({})
        data = list(data)
        for i in data:
            del i['users']
            del i['events']
        return jsonify(data), 200

    def getTopic(self,topicId):
        topic = db.topics.find_one({'_id': topicId})
        return topic

    def addUser(self,topicId,UserId):
        topic = db.topics.find_one({'_id': topicId})
        users = set(topic['users'])
        users.add(UserId)
        users = list(users)
        topic = db.topics.update_one({'_id': topicId},{'$set': {'users': users}})
        return

    def removeUser(self,topicId,UserId):
        topic = db.topics.find_one({'_id': topicId})
        users = set(topic['users'])
        users.remove(UserId)
        users = list(users)
        topic = db.topics.update_one({'_id': topicId},{'$set': {'users': users}})
        return

    def addEvent(self,topicId,EventId):
        topic = db.topics.find_one({'_id': topicId})
        events = set(topic['events'])
        events.add(EventId)
        events = list(events)
        topic = db.topics.update_one({'_id': topicId},{'$set': {'events': events}})
        return

    def removeEvent(self,topicId,EventId):
        topic = db.topics.find_one({'_id': topicId})
        events = set(topic['events'])
        events.remove(EventId)
        events = list(events)
        topic = db.topics.update_one({'_id': topicId},{'$set': {'events': events}})
        return

    def getEventIdsFromTopic(self,topicId):
        topic = db.topics.find_one({'_id': topicId})
        events = set(topic['events'])
        return events
