from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <html>
    <head>
        <title>CloudPulse</title>
        <style>
            body {
                background-color: #0f172a;
                color: white;
                text-align: center;
                font-family: Arial;
                padding-top: 100px;
            }
            h1 {
                font-size: 50px;
            }
            p {
                font-size: 20px;
                color: #38bdf8;
            }
        </style>
    </head>
    <body>
        <h1>🚀 CloudPulse</h1>
        <p>CloudPulse CI/CD Auto Deployment is Working 🚀</p>
    </body>
    </html>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
