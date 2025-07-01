resource "aws_iam_user" "my_bucket_full_access" {
  name = "my-bucket-full-access-user"
}

resource "aws_iam_user_policy_attachment" "my_bucket_full_access" {
  user       = aws_iam_user.my_bucket_full_access.name
  policy_arn = aws_iam_policy.my_bucket_full_access.arn
}

resource "aws_iam_access_key" "my_bucket_full_access" {
  user = aws_iam_user.my_bucket_full_access.name
}

resource "aws_secretsmanager_secret" "my_bucket_full_access_keys" {
  name = "my-bucket-full-access-keys"
}

resource "aws_secretsmanager_secret_version" "my_bucket_full_access_keys" {
  secret_id = aws_secretsmanager_secret.my_bucket_full_access_keys.id
  secret_string = jsonencode({
    access_key = aws_iam_access_key.my_bucket_full_access.id
    secret_key = aws_iam_access_key.my_bucket_full_access.secret
  })
}

output "my_bucket_full_access_keys_cli" {
  value = "aws secretsmanager get-secret-value --region eu-north-1 --secret-id ${aws_secretsmanager_secret.my_bucket_full_access_keys.name} --query SecretString --output text"
}

output "my_bucket_full_access_keys_console" {
  value = "https://eu-north-1.console.aws.amazon.com/secretsmanager/secret?name=${aws_secretsmanager_secret.my_bucket_full_access_keys.name}&region=eu-north-1"
}
