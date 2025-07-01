terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

variable "name" {
  description = "name of the user"
  type        = string
}

resource "aws_iam_user" "this" {
  name = var.name
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_secretsmanager_secret" "keys" {
  name = "${var.name}-keys"
}

resource "aws_secretsmanager_secret_version" "keys" {
  secret_id = aws_secretsmanager_secret.keys.id
  secret_string = jsonencode({
    access_key = aws_iam_access_key.this.id
    secret_key = aws_iam_access_key.this.secret
  })
}

output "name" {
  value = aws_iam_user.this.name
}

output "keys_cli" {
  value = "aws secretsmanager get-secret-value --region eu-north-1 --secret-id ${aws_secretsmanager_secret.keys.name} --query SecretString --output text"
}

output "keys_console" {
  value = "https://eu-north-1.console.aws.amazon.com/secretsmanager/secret?name=${aws_secretsmanager_secret.keys.name}&region=eu-north-1"
}
