resource "aws_iam_user" "illthizam" {
  name = var.users
  path = "/"

  tags = {
    name = "user"
  }
}