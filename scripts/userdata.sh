#!/bin/bash
# System updates
yum update -y

# Docker installation (Amazon Linux 2 optimized)
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user
systemctl enable docker
chmod 666 /var/run/docker.sock  # Ensures non-root access

# kubectl installation (specific version)
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.9/2023-01-11/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/  # System-wide access
