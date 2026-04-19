# 📘 CloudPulse DevOps Project – Day 10 Notes

## 🎯 Objective

Finalize the CloudPulse DevOps pipeline by integrating monitoring and documenting the project for GitHub and portfolio use.

---

## ⚙️ What Was Done

### 1. Monitoring Stack Setup

* Installed Prometheus using Helm
* Installed Grafana using Helm
* Verified pods in `monitoring` namespace
* Exposed Grafana using port-forward

---

### 2. Grafana Configuration

* Logged into Grafana using admin credentials

* Added Prometheus as a data source:

  ```text
  http://prom-prometheus-server
  ```

* Verified connection using **Save & Test**

---

### 3. Dashboard Creation

Created initial infrastructure dashboard with:

* System Health → `avg(up)`
* CPU Usage → percentage-based query
* Memory Usage → calculated usage %
* Disk Available → available storage %

Configured:

* Time series panels for metrics
* Stat panel for health
* Thresholds for visualization (green/yellow/red)

---

### 4. Application Metrics Integration

* Installed `prometheus_flask_exporter`
* Updated Flask app to expose `/metrics`
* Verified metrics endpoint inside container
* Observed metrics such as:

  * Python GC metrics
  * HTTP request metrics

---

### 5. Prometheus Scraping Attempt

* Added annotations to Kubernetes deployment:

  ```yaml
  prometheus.io/scrape: "true"
  prometheus.io/port: "5000"
  prometheus.io/path: "/metrics"
  ```

* Restarted deployment

* Attempted to verify metrics in Prometheus

---

### 6. Challenges Faced

* Grafana dashboards lost due to no persistence
* Prometheus pod scheduling issues (Pending state)
* Resource limitations on EC2 instance
* ArgoCD overriding manual changes
* Service connection issues between Grafana and Prometheus

---

## 🧠 Key Learnings

* Importance of persistent storage in Grafana
* Difference between ClusterIP and external access
* Debugging Kubernetes pods (`Pending`, `Evicted`, `Error`)
* Prometheus service vs container port mismatch
* GitOps behavior with ArgoCD

---

## 📊 Current Status

* CloudPulse app: Running on Kubernetes ✅
* ArgoCD: Working and syncing ✅
* Grafana: Running and accessible ✅
* Prometheus: Partially working ⚠️
* App metrics endpoint: Working (`/metrics`) ✅

---

## 🚧 Decision

Due to resource limitations and time constraints, full Prometheus integration was not finalized.

Project is concluded with:

* Working deployment pipeline
* Basic monitoring setup
* Metrics endpoint implemented

---

## 🚀 Next Steps (Future)

* Move to AWS EKS for better scalability
* Add Terraform for infrastructure automation
* Implement persistent storage for all services
* Complete Prometheus-Grafana integration
* Add alerting system

---

## 📌 Summary

Day 10 focused on monitoring and finalizing the project.

Even though full observability wasn’t completed, the project successfully demonstrates:

* CI/CD pipeline
* GitOps workflow
* Kubernetes deployment
* Basic monitoring setup

---

## 👤 Author Note

This project provided hands-on experience with real-world DevOps tools and debugging scenarios, forming a strong foundation for cloud and DevOps roles.

---
