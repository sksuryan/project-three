from marshmallow import fields, Schema
from marshmallow.validate import Length

class UserProfileFormSchema(Schema):
    name = fields.Str(required=False, valdiate=Length(max=100))
    topics = fields.List(fields.Dict(), required=True)
    on_location = fields.Boolean(required=True) 
    qualif = fields.Str(required=False)
    stream = fields.Str(required=False)
    exp = fields.Integer(required=False)
    linkedin = fields.Url(required=False)
    portfolio = fields.Url(required=False)
    vid_list = fields.List(fields.Url(),required=False)
    dates = fields.List(fields.Date(),required=False)

class OrgProfileFormSchema(Schema):
    name = fields.Str(required=False, valdiate=Length(max=100))
    weburl = fields.Url(required=True)
    desc = fields.Str(required=False)

user_profile_schema = UserProfileFormSchema()
org_profile_schema = OrgProfileFormSchema()