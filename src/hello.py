# hello.py
from flask import Flask, make_response

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, Botit!'

@app.route('/<page_name>')
def other_page(page_name):
    response = make_response('The page named %s does not exist.' \
                             % page_name, 404)
    return response

@app.route('/health')
def health_check():
    return 'Healthy', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0')