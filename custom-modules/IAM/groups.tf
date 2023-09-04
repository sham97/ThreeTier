# group 
resource "aws_iam_group" "devops" {
  name = "DevOps"
  #path = "/users/"
}

#associate users to group above we create

resource "aws_iam_group_membership" "devops-team" {
  name  = "devops team membership"
  users = [aws_iam_user.illthizam.name]
  group = aws_iam_group.devops.name
}