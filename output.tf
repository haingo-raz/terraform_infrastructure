output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "webapp_ecr_repo_url" {
  value = aws_ecr_repository.webapp.repository_url
}

output "mysql_ecr_repo_url" {
  value = aws_ecr_repository.mysql.repository_url
}
