resource "aws_ecr_repository" "webapp" {
  name = var.web_ecr_name
}

resource "aws_ecr_repository" "mysql" {
  name = var.mysql_ecr_name
}
