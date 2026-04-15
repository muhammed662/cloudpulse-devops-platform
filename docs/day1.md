# Day 1 - Flask App Setup

## What I did
- Created CloudPulse project in Ubuntu
- Set up Python virtual environment
- Installed Flask inside venv
- Created a Flask app (app.py)
- Added multiple routes (/, /health, /about)
- Ran the app locally

## What I learned
- Flask can run a local web server
- Apps run on localhost:5000
- Virtual environments isolate dependencies
- Flask uses routes to serve responses
- 200 means success, 404 means resource not found

## Issues faced
- Could not install Flask due to externally-managed-environment error
- Tried to run the app before creating it
- Saw favicon.ico 404 error

## Fix / Solution
- Created a virtual environment and installed Flask
- Created app.py before running
- Understood favicon error is normal