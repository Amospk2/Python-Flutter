from random import choice
import string
from __init__ import app

random_str = string.ascii_letters + string.digits + string.ascii_uppercase
key = '.'.join(choice(random_str) for i in range(12))

DEBUG = True
SQLALCHEMY_DATABASE_URI = 'mysql://your_mysql_user:your_mysql_password@127.0.0.1:3306/flaskapi'
SQLALCHEMY_TRACK_MODIFICATIONS = False
SECRET_KEY = key