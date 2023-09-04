
#attach policy to user illthizam
resource "aws_iam_policy_attachment" "test-attach" {
  name          = "test-atatchement-user-EC2-Access"
  policy_arn    = aws_iam_policy.Ec2-full-Access.arn
  users         = [aws_iam_user.illthizam.name]

}

