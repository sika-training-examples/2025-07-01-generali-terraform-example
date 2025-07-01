resource "aws_s3_bucket" "another_bucket" {
  bucket        = "generali-another-bucket"
  force_destroy = true # Allows deletion of non-empty buckets
}
