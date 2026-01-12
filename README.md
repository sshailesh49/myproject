# DevOps Assignment: Two-Tier Web Application

This repository contains a full-stack web application (Python Backend + Next.js Frontend) with a complete DevOps pipeline including Containerization, CI/CD, and Infrastructure as Code (IaC) for AWS and GCP.

## Project Structure
- `backend/`: FastAPI application
- `frontend/`: Next.js application
- `terraform/`: IaC configurations for AWS and GCP
- `.github/workflows/`: CI/CD pipelines

## 🚀 Getting Started

### Prerequisites
- Docker & Docker Compose
- Git

### Run Locally
```bash
docker-compose up --build
```
Access the application:
- Frontend: [http://localhost:3000](http://localhost:3000)
- Backend API: [http://localhost:8000/api/message](http://localhost:8000/api/message)
- Backend Documentation: [http://localhost:8000/docs](http://localhost:8000/docs)

## 🛠️ CI/CD Pipeline
Managed via GitHub Actions:
- **CI (`develop` branch)**: Runs tests (Pytest/Jest), builds Docker images, and pushes to Registry (Mocked).
- **CD (`main` branch)**: Deploys infrastructure using Terraform to AWS and GCP.

## ☁️ Infrastructure
### AWS
- **Resource**: ECS Cluster (Fargate), ALB, VPC
- **Monitoring**: CloudWatch Alarm for CPU > 70%

### GCP
- **Resource**: Cloud Run Services (Frontend/Backend)
- **Monitoring**: Cloud Monitoring Alert Policy for High CPU

## 🔐 Security
- **Least Privilege**: IAM roles defined for specific services.
- **Secrets**: CI/CD uses GitHub Secrets (`AWS_ACCESS_KEY_ID`, `GCP_CREDENTIALS`, etc.).
- **Docker**: Containers run as non-root users (`appuser` / `nextjs`).

## 🧪 Testing
- **Backend**: Unit tests using `pytest` located in `backend/test_main.py`
- **Frontend**: Unit tests using `jest` (infrastructure ready)
