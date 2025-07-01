module "my_bucket_write_only_user" {
  source = "git::https://github.com/sika-training-examples/2025-07-01-generali-terraform-example.git//modules/user"

  name = "my-bucket-write-only-user"
}

resource "aws_iam_user_policy_attachment" "my_bucket_write_only_user" {
  user       = module.my_bucket_write_only_user.name
  policy_arn = aws_iam_policy.my_bucket_write_only.arn
}

output "my_bucket_write_only_user" {
  value = module.my_bucket_write_only_user
}
