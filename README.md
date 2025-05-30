# Terraform AWS Infrastructure Deployment

This project uses **Terraform** and **GitHub Actions** to deploy an EC2 instance and ECR repositories on AWS.

## Prerequisites

- AWS Account
- Key pair created in AWS
- GitHub Secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_SESSION_TOKEN`
  - `AWS_KEY_NAME` (your key pair name)

## How It Works

GitHub Actions automatically deploys infrastructure when you:

- Push changes to `.tf` files on the `main` branch
- Manually trigger the workflow from GitHub (via **Actions > Run workflow**)