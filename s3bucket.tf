resource "aws_s3_bucket" "s3_bucket" {
  # bucket = "priyankanayakbucket"
  bucket_prefix = var.s3_bucket_prefix

  force_destroy = true

  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       sse_algorithm = "AES256"
  #     }
  #   }
  # }
}


resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_configuration" {

  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    id = "id1"
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_resource" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
# resource "aws_s3_bucket_policy" "s3_policy" {

#   bucket = aws_s3_bucket.s3_bucket.id

#   policy = file("s3policy.json")

# }
