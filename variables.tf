variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "app_name" {
  type    = string
  default = "webapp"
}

variable "ec2_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "key_name" {
  type        = string
  description = "Key Pair for SSH"
}

variable "web_ecr_name" {
  type    = string
  default = "webapp-repo"
}

variable "mysql_ecr_name" {
  type    = string
  default = "mysql-repo"
}