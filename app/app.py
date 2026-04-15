from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "CloudPulse CI/CD is working 🚀"

@app.route('/health')
def health():
    return "OK - CloudPulse is running"

@app.route('/about')
def about():
    return "CloudPulse DevOps Project by Muhammed"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)