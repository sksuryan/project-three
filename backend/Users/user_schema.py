from marshmallow import fields, Schema
from marshmallow.validate import Length

class ProfileFormSchema(Schema):
    name = fields.Str(required=False, valdiate=Length(max=100))
    topics = fields.List(fields.Str(), required=True)
    on_location = fields.Boolean(required=True) 
    qualif = fields.Str(required=False)
    stream = fields.Str(required=False)
    exp = fields.Integer(required=False)
    linkedin = fields.Url(required=False)
    portfolio = fields.Url(required=False)
    vid_list = fields.List(fields.Url(),required=False)
    dates = fields.List(fields.Date(),required=False)

profile_schema = ProfileFormSchema()