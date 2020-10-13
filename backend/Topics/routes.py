from app.app import app
from Users.model import checkJWT
from Topics.model import Topics

@app.route('/topics',methods = ['GET'])
@checkJWT
def getTopics(userId):
    return Topics().getTopics()