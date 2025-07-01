data "aws_iam_policy_document" "my_bucket_full_access" {
  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.my_bucket.arn]
  }
  statement {
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.my_bucket.arn}/*"]
  }
}

resource "aws_iam_policy" "my_bucket_full_access" {
  name        = "my-bucket-full-access-policy"
  description = "Policy for full access to ${aws_s3_bucket.my_bucket.bucket}"
  policy      = data.aws_iam_policy_document.my_bucket_full_access.json
}
