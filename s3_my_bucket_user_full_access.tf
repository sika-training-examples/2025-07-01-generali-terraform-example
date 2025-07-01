module "my_bucket_full_access_user" {
  source = "./modules/user"

  name = "my-bucket-full-access-user"
}

resource "aws_iam_user_policy_attachment" "my_bucket_full_access" {
  user       = module.my_bucket_full_access_user.name
  policy_arn = aws_iam_policy.my_bucket_full_access.arn
}

output "my_bucket_full_access" {
  value = module.my_bucket_full_access_user
}
