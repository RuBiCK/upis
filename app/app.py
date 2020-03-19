import os
from flask import Flask, flash, request, redirect, url_for
import datetime

UPLOAD_FOLDER = os.environ.get('UPLOAD_FOLDER','.')
DEBUG = os.environ.get('DEBUG',False)
PORT = os.environ.get('PORT', '3001')
DEBUG_FLASK = os.environ.get('DEBUG_FLASK', False)

ALLOWED_EXTENSIONS = {'jpg', 'jpeg'}
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = '.'
app.secret_key = 'g1w890GHS&$_'

if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

@app.route('/', methods=['POST'])
def rupload():
    x = datetime.datetime.now()
    filename = x.strftime("%Y%m%d%H%M%S.jpg")
    fileFullPath = os.path.join(UPLOAD_FOLDER, filename)

    with open(fileFullPath, 'wb') as f:
        f.write(request.get_data(cache=True, as_text=False, parse_form_data=False))

    if DEBUG:
        sys.stdout.write('Picture ' + filename + ' saved\n')

    return ('200')
app.run(host="0.0.0.0", port=PORT, debug=DEBUG_FLASK)