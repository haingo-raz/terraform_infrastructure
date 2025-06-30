#!/bin/bash

# Exit immediately on error
set -e

# System updates
yum update -y

# Docker installation (Amazon Linux 2 optimized)
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user
systemctl enable docker
chmod 666 /var/run/docker.sock  # Ensures non-root access

# kubectl installation (specific version)
curl -LO https://s3.us-west-2.amazonaws.com/amazon-eks/1.30.7/2024-12-12/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/  # System-wide access

# Install kind (Kubernetes in Docker)
curl -sLo kind https://kind.sigs.k8s.io/dl/v0.11.0/kind-linux-amd64
sudo install -o root -g root -m 0755 kind /usr/local/bin/kind
rm -f ./kind
