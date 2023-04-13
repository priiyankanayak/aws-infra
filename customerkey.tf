resource "aws_kms_key" "key_ebs" {
  description              = "Created key manually"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  #   enable_key_rotation      = true
  #   is_enabled               = true
  deletion_window_in_days = 7
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "kms:*"
        ]
        Resource = "*"
      },
      {
        Sid    = "Enable EBS Encryption"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "kms:Encrypt*",
          "kms:Decrypt*",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ]
        Resource = "*"
      }
    ]
  })
}

# resource "aws_kms_alias" "alias_key" {
#   name_prefix   = "alias/ec2-alias-"
#   target_key_id = aws_kms_key.ebs_key.key_id
# }


# resource "aws_kms_key" "key_rds" {
#     description = "Manually created database key"
#     customer_master_key_spec = "SYMMETRIC_DEFAULT"
#     enable_key_rotation = true
#     is_enabled = true
# }

resource "aws_kms_key" "key_rds" {
  description              = "Manually created database key"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  #   enable_key_rotation      = true
  #   is_enabled               = true
  deletion_window_in_days = 7
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "kms:*"
        ]
        Resource = "*"
      },
      {
        Sid    = "Enable EBS Encryption"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "kms:Encrypt*",
          "kms:Decrypt*",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ]
        Resource = "*"
      }
    ]
  })
}