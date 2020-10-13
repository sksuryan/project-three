from marshmallow import fields, Schema
from marshmallow.validate import Length

class EventCreationSchema(Schema):
    name = fields.Str(required=True, valdiate=Length(max=100))
    topics = fields.List(fields.Dict(), required=True)
    on_location = fields.Boolean(required=True) 
    details = fields.String(required=True)
    dates = fields.List(fields.Date(),required=False)
    weburl = fields.Url(required=False)

event_creation_schema = EventCreationSchema()