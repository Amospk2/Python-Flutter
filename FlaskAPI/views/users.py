import json
from multiprocessing.connection import wait
from werkzeug.security import generate_password_hash
from __init__ import db
from flask import request, jsonify
from models.users import Users, user_schema, users_schema

def post_user():
    register = request.get_json(force=True)
    
    username = register['username']
    password = register['password']
    name = register['name']
    email = register['email']

    pass_hash = generate_password_hash(password)

    user = Users(username, pass_hash, name, email)

    try:
        db.session.add(user)
        db.session.commit()
        result = user_schema.dump(user)
        return jsonify({'message':'sucessfully registered', 'data':result}), 201
    except Exception as ex:
        return jsonify({'message':'unable to create', 'data':{}}), 500

def update_user(id):
    register = request.get_json(force=True)

    username = register['username']
    password = register['password']
    name = register['name']
    email = register['email']

    user = Users.query.get(id)

    if not user:
        return jsonify({'message':"user don't exist", 'data':{}}), 404

    pass_hash = generate_password_hash(password)

    try:
        user.username = username
        user.password = pass_hash
        user.name = name
        user.email = email
        db.session.commit()

        result = user_schema.dump(user)
        return jsonify({'message':'sucessfully update', 'data':result}), 201
    except Exception as ex:
        return jsonify({'message':'unable to update', 'data':{}}), 500

def get_users():
    users = Users.query.all()

    if users:
        result = users_schema.dump(users)
        return jsonify({'message':'sucessfully fetched', 'data':result})

    return jsonify({'message':'nothing found', 'data':{}})

def get_user(id):

    user = Users.query.get(id)

    if user:
        result = user_schema.dump(user)
        return jsonify({'message':'sucessfully fetched', 'data':result})

    return jsonify({'message':'nothing found', 'data':{}})


def delete_user(id):
    user = Users.query.get(id)

    if not user:
        return jsonify({'message':"user don't exist", 'data':{}}), 404

    else:
        try:
            db.session.delete(user)
            db.session.commit()
            result = user_schema.dump(user)
            return jsonify({'message':'sucessfully delete', 'data':result}), 200

        except:
            return jsonify({'message':'unable to delete', 'data':{}}), 500
        
def user_by_username(username):
    try:
        return Users.query.filter(Users.username == username).one()
    except:
        return None

