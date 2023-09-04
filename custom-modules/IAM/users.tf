resource "aws_iam_user" "illthizam" {
  name = "illthizamN"
  path = "/"

  tags = {
    name = "user"
  }
}