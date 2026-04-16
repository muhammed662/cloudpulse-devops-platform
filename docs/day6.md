today set up nginx to make the app accessible without :5000

installed nginx and started the service, checked using public ip and saw the default nginx page so installation was correct

then edited the default config file and added proxy_pass to 127.0.0.1:5000 so that nginx forwards requests to the flask app

restarted nginx after config changes

ran the flask app again and tested using public ip without port and it worked

understood that nginx is acting as a reverse proxy between user and flask

initially confused between accessing using ip:5000 and just ip but got clarity that port 80 is handled by nginx

final flow now is user → nginx → flask

app still running manually using python app.py

next step is to dockerize the app
