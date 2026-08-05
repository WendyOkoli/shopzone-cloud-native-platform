# ShopZone — Cloud Native E Commerce Platform

A cloud native e commerce platform that enables customers to browse products, place orders, and manage their accounts through a scalable web application deployed on AWS using a fully automated CI/CD pipeline with infrastructure provisioned entirely as code.

Built as an AWS DevOps Competency reference implementation, demonstrating automated application delivery, Infrastructure as Code, container orchestration, and operational excellence using Amazon ECS Fargate, GitHub Actions, Terraform, and Amazon CloudWatch.

---

# Architecture

```
                              Internet
                                 │
                        ┌────────▼────────┐
                        │  Application     │
                        │  Load Balancer   │
                        │ (Public Subnets) │
                        └────────┬────────┘
                                 │
                                 │ HTTP / HTTPS
                                 ▼
              ┌────────────────────────────────────┐
              │        Amazon ECS Fargate          │
              │      ShopZone Application          │
              │                                    │
              │   ┌──────────┐   ┌──────────┐      │
              │   │  Task 1  │   │  Task 2  │      │
              │   └────┬─────┘   └────┬─────┘      │
              └────────┼──────────────┼────────────┘
                       │              │
                       │              │
             ┌─────────▼──────┐   ┌──▼─────────────────┐
             │   Amazon S3     │   │ Amazon RDS         │
             │ Product Images  │   │ PostgreSQL         │
             │ Static Assets   │   │ Product & Orders   │
             └─────────────────┘   └────────────────────┘

                  Amazon CloudWatch
        Logs • Metrics • Alarms • Dashboard

────────────────────────────────────────────────────────────

GitHub
    │
    ▼
GitHub Actions
(Build → Test → Docker Build → Push Image)

    │
    ▼
Amazon ECR

    │
    ▼
Amazon ECS Fargate

Terraform provisions and manages every AWS resource.
```

---

# AWS Services Used

| Service | Purpose |
|----------|---------|
| GitHub | Source control |
| GitHub Actions | Continuous Integration and Continuous Deployment |
| Terraform | Infrastructure as Code |
| Amazon ECS Fargate | Hosts the containerized ShopZone application |
| Amazon ECR | Stores Docker container images |
| Application Load Balancer | Routes traffic and performs health checks |
| Amazon RDS PostgreSQL | Stores product, customer, and order data |
| Amazon S3 | Stores product images and static assets |
| Amazon CloudWatch | Monitoring, logging, dashboards, and alarms |

---

# Key Features

### Automated CI/CD

Every change committed to the main branch automatically builds, validates, containerizes, and deploys the application, reducing manual effort and accelerating software delivery.

### Infrastructure as Code

The complete AWS environment is provisioned using Terraform, ensuring repeatable deployments, configuration consistency, and version controlled infrastructure.

### Containerized Application

The ShopZone application runs as Docker containers on Amazon ECS Fargate, eliminating server management while providing scalable application hosting.

### High Availability

Application traffic is distributed through an Application Load Balancer across multiple ECS tasks, ensuring application availability during periods of increased shopping activity.

### Centralized Monitoring

Amazon CloudWatch collects application logs, infrastructure metrics, and health information, providing operational visibility through dashboards and alarms.

### Scalable Storage

Amazon S3 stores product images and static assets independently from the application, allowing the platform to scale efficiently as product catalogues grow.

---

# Repository Structure

```
shopzone-cloud-native-platform/

├── terraform/
│   ├── main.tf
│   ├── vpc.tf
│   ├── ecs.tf
│   ├── ecr.tf
│   ├── alb.tf
│   ├── rds.tf
│   ├── s3.tf
│   ├── cloudwatch.tf
│   ├── iam.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── app/
│   ├── backend/
│   ├── frontend/
│   ├── database/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── package.json
│   └── server.js
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
└── README.md
```

---

# Getting Started

Provision the infrastructure.

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

Build the application.

```bash
cd ../app

docker build -t shopzone-app .
```

Push the latest code.

```bash
git push origin main
```

GitHub Actions automatically:

- Builds the application
- Runs validation checks
- Builds the Docker image
- Pushes the image to Amazon ECR
- Deploys the latest version to Amazon ECS

---

# Business Benefits

The implemented platform enables ShopZone to:

- Automate software deployments
- Reduce manual infrastructure provisioning
- Improve deployment consistency
- Scale application capacity during shopping peaks
- Improve application availability
- Centralize operational monitoring
- Accelerate feature delivery through CI/CD

---

# Monitoring

Amazon CloudWatch provides:

- Application logs
- Container logs
- ECS service metrics
- CPU and memory utilization
- Application Load Balancer health checks
- ECS task health
- Dashboard for operational visibility

---

# Solution Overview

**Customer:** ShopZone

**AWS Partner:** Descasio

**Solution:** Cloud Native E Commerce Platform

**Focus Areas**

- Infrastructure as Code
- Continuous Integration
- Continuous Deployment
- Containerization
- Monitoring and Observability
- Cloud Native Modernization
- DevOps Automation
