# Day 9 — CloudPulse

## what i did

* removed old ec2 instance

* used terraform ec2 as main server

* installed k3s on ec2

* fixed notready node issue by upgrading instance

* fixed kubeconfig permission

* installed argo cd

* exposed argo using port forward

* opened port 8080 in security group

* connected argo to github repo

* deployed app using k8s manifests

* exposed app using nodeport

* opened port range 30000-32767

* removed old ec2 deploy workflow

* now only docker build + push workflow runs

## what i learned

* argo cd tracks git changes not docker image updates
* using latest tag does not trigger redeploy
* need rollout restart to pull new image
* importance of security group rules
* difference between manual deploy vs gitops

## what worked

* argo cd deployment successful
* app accessible via ec2 public ip
* ci pipeline building and pushing images
* app updates reflected after restart

## what next

* install prometheus and grafana
* add metrics endpoint to flask app
* build monitoring dashboards
