from flask import Flask, request, render_template
from flask.helpers import make_response
import jwt
from authlib.jose import jwk


app = Flask(__name__)
app.config['JWT_ALGORITHM'] = 'RS256'
app.config['JWT_SECRET_KEY'] = open('id_rsa.pem').read() 
app.config['JWT_PUBLIC_KEY'] = open('id_rsa.pub').read()

def check_if_authenticated(template):
    if 'ACCESS_TOKEN' not in request.cookies:
        resp = make_response(render_template(template))
        resp.set_cookie('ACCESS_TOKEN', generate_token('guest', False), max_age= 60*60*24)
        return resp
    resp = make_response(render_template(template))
    return resp

def generate_token(user, logged_in):
    token = jwt.encode({"user": user, "logged_in" : logged_in}, 
                        app.config['JWT_SECRET_KEY'], 
                        algorithm= app.config['JWT_ALGORITHM'],
                        headers={"public_key": jwk.dumps(app.config['JWT_PUBLIC_KEY'], kty='RSA')}
    )
    return token

@app.route('/', methods=['GET', 'POST'])
def index():
    return check_if_authenticated('login.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        return render_template('login.html', response = "Login page is under construction.")
    return render_template('login.html')

@app.route('/flag', methods = ['GET'])
def flag():
    try:
        token = jwt.decode(request.cookies['ACCESS_TOKEN'], app.config['JWT_PUBLIC_KEY'], verify=True, algorithms= app.config['JWT_ALGORITHM'])
        if token['logged_in']:
            return render_template('flag.html', response = "--redacted--")
        else:
            return index()
    except:
        return index()