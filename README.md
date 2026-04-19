# 🚀 CloudPulse DevOps Platform

CloudPulse is an end-to-end cloud-native DevOps project that demonstrates how modern applications are built, deployed, and monitored using industry-standard tools.

This project showcases a complete CI/CD pipeline, GitOps workflow, container orchestration, and basic observability setup.

---

## 📌 Project Overview

The goal of this project was to simulate a real-world DevOps environment where:

* Applications are containerized using Docker
* Deployments are automated via CI/CD pipelines
* Infrastructure is managed using Kubernetes
* Git is used as the single source of truth (GitOps)
* Monitoring is implemented using Prometheus and Grafana

---

## 🧰 Tech Stack

### ☁️ Cloud & Infrastructure

* AWS EC2 (Ubuntu)
* Kubernetes (K3s)

### ⚙️ DevOps Tools

* Docker (Containerization)
* GitHub Actions (CI/CD)
* ArgoCD (GitOps Deployment)

### 📊 Monitoring & Observability

* Prometheus (Metrics Collection)
* Grafana (Visualization)

### 🧑‍💻 Application

* Flask (Python backend)

---

## 🏗️ Architecture

```
Developer → GitHub → GitHub Actions → Docker Hub → ArgoCD → Kubernetes → Application
                                                       ↓
                                                Prometheus → Grafana
```

---

## 🔄 CI/CD & GitOps Workflow

1. Developer pushes code to GitHub
2. GitHub Actions builds Docker image
3. Image is pushed to Docker Hub
4. ArgoCD detects changes in Git repository
5. ArgoCD syncs and deploys to Kubernetes
6. Application updates automatically without manual intervention

---

## ⚙️ Features Implemented

* ✅ Dockerized Flask application
* ✅ Kubernetes Deployment and Service
* ✅ GitOps workflow using ArgoCD
* ✅ Automated CI/CD pipeline using GitHub Actions
* ✅ Monitoring setup with Prometheus and Grafana
* ✅ Application metrics endpoint (`/metrics`)
* ✅ Basic infrastructure dashboard (CPU, Memory, Disk)

---

## 📊 Monitoring

### Infrastructure Monitoring

* CPU usage
* Memory usage
* Disk availability
* Node health

### Application Monitoring

* HTTP request count
* Request rate
* Request latency

---

## 🧪 How to Run (High-Level)

1. Launch EC2 instance
2. Install Docker & Kubernetes (K3s)
3. Clone repository
4. Deploy application using Kubernetes manifests
5. Set up ArgoCD for GitOps
6. Configure GitHub Actions for CI/CD
7. Install Prometheus & Grafana for monitoring

---

## 📸 Screenshots

> Add the following screenshots here:

* Kubernetes pods running (`kubectl get pods -A`)
* ArgoCD dashboard (Synced & Healthy)
* Grafana dashboard
* Application running in browser

---

## ⚠️ Challenges Faced

* Resource limitations on EC2 affecting monitoring stack
* Debugging Kubernetes pod failures and evictions
* Configuring Prometheus scraping for application metrics
* Managing ArgoCD sync vs manual changes

---

## 📈 Learnings

* Understanding Kubernetes architecture and deployments
* Implementing GitOps with ArgoCD
* Building CI/CD pipelines with GitHub Actions
* Setting up monitoring using Prometheus and Grafana
* Debugging real-world DevOps issues

---

## 🚀 Future Improvements

* Add Terraform for infrastructure provisioning
* Deploy on AWS EKS instead of single-node cluster
* Implement alerting (Grafana/Prometheus alerts)
* Add NGINX Ingress for clean routing
* Improve UI and frontend

---

## 📌 Project Status

Completed core DevOps pipeline with basic observability setup.
Further improvements can be made for scalability and production readiness.

---

## 👤 Author

Muhammed Latheef
BTech CSE | Aspiring Cloud & DevOps Engineer

---

## 💬 Summary

This project demonstrates how modern DevOps practices enable faster, reliable, and automated application delivery using cloud-native tools.

---
