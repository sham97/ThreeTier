#role creation 
resource "aws_iam_role" "test_role" {
  name               = "S3-Access"
  force_detach_policies = var.force_detach_policies
  assume_role_policy = data.aws_iam_policy_document.s3_full_access.json
  managed_policy_arns = [aws_iam_policy.Ec2-full-Access.arn]
  
  tags = {
    Role = "Test-Role"
  }
}

resource "aws_iam_role" "Ec2_role" {
  name                 = "Ec2_role"
  managed_policy_arns = [ aws_iam_policy.Ec2-full-Access.arn ]
  assume_role_policy = data.aws_iam_policy_document.assume_role1.json 
  tags = {
    name = "EC2_Role"
  }
}

resource "aws_iam_role_policy" "Ec2_access_S3_full_access" {
  depends_on = [ aws_iam_policy.Ec2-full-Access ]
  name = "EC2_full_access_to_S3"
  role = aws_iam_role.Ec2_role.name
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
    
  })
}

