# Day 2 - Dockerizing the Application

## What I did
- Installed Docker on Ubuntu
- Resolved package conflict during Docker installation
- Created a Dockerfile for the Flask app
- Built a Docker image (cloudpulse-app)
- Ran the Flask app inside a Docker container
- Exposed the app using port mapping

## What I learned
- Docker packages an application along with its dependencies
- A Docker image is a blueprint, and a container is a running instance
- Dockerfile defines how the image is built
- docker build requires a build context (.)
- docker run starts a container from an image
- Port mapping (-p 5000:5000) connects local machine to container
- Containers isolate applications from the host system

## Issues faced
- Docker installation failed due to containerd and containerd.io conflict
- Initially ran docker build without specifying build context

## Fix / Solution
- Removed conflicting container runtime packages and reinstalled Docker
- Used docker build -t cloudpulse-app . to specify current directory as build context

## Outcome
- Successfully ran the Flask app inside a Docker container
- Accessed the containerized app through browser (localhost:5000)