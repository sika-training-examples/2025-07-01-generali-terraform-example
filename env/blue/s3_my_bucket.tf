resource "aws_s3_bucket" "my_bucket" {
  bucket        = "generali-my-bucket"
  force_destroy = true # Allows deletion of non-empty buckets
}
