import json

def load_test_data(filename):
    with open(filename,"r") as f:
        return json.load(f)

def create_post_body(name,title,id=30,userId=1):
    return {"name":name,
            "title":title,
            "id":id,
            "userId":userId}