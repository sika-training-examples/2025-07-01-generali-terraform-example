resource "aws_iam_user" "my_bucket_write_only" {
  name = "my-bucket-write-only-user"
}

resource "aws_iam_user_policy_attachment" "my_bucket_write_only" {
  user       = aws_iam_user.my_bucket_write_only.name
  policy_arn = aws_iam_policy.my_bucket_write_only.arn
}

resource "aws_iam_access_key" "my_bucket_write_only" {
  user = aws_iam_user.my_bucket_write_only.name
}

resource "aws_secretsmanager_secret" "my_bucket_write_only_keys" {
  name = "my-bucket-write-only-keys"
}

resource "aws_secretsmanager_secret_version" "my_bucket_write_only_keys" {
  secret_id = aws_secretsmanager_secret.my_bucket_write_only_keys.id
  secret_string = jsonencode({
    access_key = aws_iam_access_key.my_bucket_write_only.id
    secret_key = aws_iam_access_key.my_bucket_write_only.secret
  })
}

output "my_bucket_write_only_keys_cli" {
  value = "aws secretsmanager get-secret-value --region eu-north-1 --secret-id ${aws_secretsmanager_secret.my_bucket_write_only_keys.name} --query SecretString --output text"
}

output "my_bucket_write_only_keys_console" {
  value = "https://eu-north-1.console.aws.amazon.com/secretsmanager/secret?name=${aws_secretsmanager_secret.my_bucket_write_only_keys.name}&region=eu-north-1"
}
