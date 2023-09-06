resource "aws_iam_policy" "Ec2-full-Access" {
  name = var.Ec2-s3_full_access_name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid     = "VisualEditor0",
        Effect  = "Allow",
        Action  = "ec2:*",
        Resource = "*",
      },
    ],
  })
}


data "aws_iam_policy_document" "s3_full_access" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
  }
}


data "aws_iam_policy_document" "assume_role1" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["cloudwatch.amazonaws.com"]
    } 
  }
}


resource "aws_iam_group_policy" "developer_policy" {
  #name  = "developer_policy"
  name = "Developer-Policy"
  group = aws_iam_group.devops.name
  
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# resource "aws_iam_policy" "s3" {

#   policy = jsondecode({
    
#         Version: "2012-10-17",
#         Statement = [
#             {
#                 Effect: "Allow",
#                 Principal: {
#                     AWS: "arn:aws:iam::968017969736:user/sham"
#                 },
#                 Action: "s3:ListBucket",
#                 Resource: "arn:aws:s3:::terraform-state-illthi"
#             },
#             {
#                 Effect: "Allow",
#                 Principal: {
#                     AWS: "arn:aws:iam::968017969736:user/sham"
#                 },
#                 Action: [
#                     "s3:GetObject",
#                     "s3:PutObject"
#                 ],
#                 Resource: "arn:aws:s3:::terraform-state-illthi/*"
#             }
#         ]
    
#   })
  
# }


# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Principal": {
#                 "AWS":  "arn:aws:iam::968017969736:user/sham"
#             },
#             "Action": "s3:ListBucket",
#             "Resource": "arn:aws:s3:::terraform-state-illthi"
#         },
#         { 
#             "Effect": "Allow",
#             "Principal": {
#                 "AWS": "arn:aws:iam::968017969736:user/sham"
#             },
#             "Action": [
#                 "s3:GetObject",
#                 "s3:PutObject"
#             ],
#             "Resource": "arn:aws:s3:::terraform-state-illthi/*"
#         }
      
#     ]
# }


# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": "s3:ListBucket",
#             "Resource": "arn:aws:s3:::terraform-state-illthi"
#         },
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "s3:GetObject",
#                 "s3:PutObject"
#             ],
#             "Resource": "arn:aws:s3:::terraform-state-illthi/*"
#         }
#     ]
# }