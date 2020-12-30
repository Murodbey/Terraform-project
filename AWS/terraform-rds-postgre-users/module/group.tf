resource "aws_iam_group" "developers" {
  name = var.group_name
  path = "/"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"
  count    = length(var.user_names)
  users =  [var.user_names[count.index]]
  group = aws_iam_group.developers.name
}