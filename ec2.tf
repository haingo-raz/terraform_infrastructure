data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "app_server" {
  ami                         = data.aws_ami.latest_amazon_linux.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = data.aws_subnet.default_subnet.id
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "${var.app_name}-ec2"
  }

  user_data = file("scripts/userdata.sh")
}

data "aws_subnet" "default_subnet" {
  default_for_az    = true
  availability_zone = "us-east-1a"
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.app_name}-sg"
  description = "Allow web app access on ports 8081-8083 and SSH access on port 22"
  vpc_id      = data.aws_subnet.default_subnet.vpc_id

  ingress {
    from_port   = 8081
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # NodePort range (30000-32767) for web app access
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # kind control plane port for cluster operations
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
