resource "aws_iam_policy" "WebAppS3" {
  depends_on = [
    aws_s3_bucket.s3_bucket
  ]
  name = "WebAppS3"
  # policy = file("s3policy.json")

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : [
            "s3:PutObject",
            "s3:GetObject",
            "s3:DeleteObject"
          ],
          "Effect" : "Allow",

          "Resource" : [
            "arn:aws:s3:::${aws_s3_bucket.s3_bucket.bucket}",
            "arn:aws:s3:::${aws_s3_bucket.s3_bucket.bucket}/*"
          ]
        }
      ]
  })
}

resource "aws_iam_role" "EC2-CSYE6225" {
  name = "EC2-CSYE6225"

  # assume_role_policy = file("s3policy.json")

  assume_role_policy = <<EOF
    {
         "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
    }
    EOF

  tags = {
    "Name" = "csye6225_ec2_role"
  }

}

resource "aws_iam_role" "cloudwatch_role"{
  name = "cloudwatch_role"

  assume_role_policy = jsonencode({
    Version= "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]

    
  })
}

resource "aws_iam_role_policy_attachment" "role_attachment_policy" {
  depends_on = [
    aws_iam_policy.WebAppS3
  ]
  
  
  role       = aws_iam_role.EC2-CSYE6225.name
  policy_arn = aws_iam_policy.WebAppS3.arn

}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  role = aws_iam_role.EC2-CSYE6225.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# data "aws_iam_policy_document" "access" {

#     statement {
#       actions = [ 
#         "s3:GetObject",
#         "s3:ListBucket"
#       ]
#     }

# }