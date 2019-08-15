from flask import Flask, request, send_from_directory
from os import listdir
from os.path import getsize, join, basename
from random import choice
import json

app = Flask(__name__)

IMG_DIR = '/images'

@app.route('/all')
def all():
    return json.dumps(listdir(IMG_DIR))

@app.route('/largest', methods=['POST'])
def largest():
    files = map(lambda f: join(IMG_DIR, f), request.json)
    sizes = map(lambda f: (f, getsize(f)), files)
    return basename(max(sizes, key=lambda f: f[1])[0])

@app.route("/random.jpg")
def random_image():
    image = choice(listdir(IMG_DIR))
    return send_from_directory(IMG_DIR, image)

