# Online Store FastAPI + Kubernetes

Python FastAPI online store application deployed with Kubernetes using Infrastructure as Code and CI/CD automation.

## Stack

- Python 3.12 + FastAPI
- Docker containerization
- AWS ECR for container registry
- AWS EKS provisioned via Terraform
- Helm chart for Kubernetes deployment
- GitHub Actions for build and publish pipelines

# Architecture Diagram

```mermaid
flowchart LR
  A[GitHub Repository] -->|Push code| B[GitHub Actions CI]
  B -->|Build & push| C[AWS ECR]
  C -->|Image available| D[Flux HelmRelease]
  D -->|Deploy chart| E[AWS EKS Cluster]

  subgraph Cloud Infrastructure
    E
    F[AWS VPC]
    G[AWS ECR]
    H[AWS IAM]
  end

  E --> F
  B --> H
  C --> G
  D --> E
```