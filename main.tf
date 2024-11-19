#defining the IAM groups and attaching policies

resource "aws_iam_group" "developers" {
  name = "Developers"
}

resource "aws_iam_group_policy_attachment" "developers" {
  group      = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "developers_s3" {
  group      = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_group_policy_attachment" "developers_logs" {
  group      = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}

resource "aws_iam_group" "operations" {
  name = "Operations"
}

resource "aws_iam_group_policy_attachment" "operations" {
  group      = aws_iam_group.operations.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "operations_rds" {
  group      = aws_iam_group.operations.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_group_policy_attachment" "operations_ssm" {
  group      = aws_iam_group.operations.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_group" "finance" {
  name = "Finance"
}

resource "aws_iam_group_policy_attachment" "finance_billing" {
  group      = aws_iam_group.finance.name
  policy_arn = "arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "finance_readonly" {
  group      = aws_iam_group.finance.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group" "analysts" {
  name = "Analysts"
}

resource "aws_iam_group_policy_attachment" "analysts_s3" {
  group      = aws_iam_group.analysts.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "analysts_rds" {
  group      = aws_iam_group.analysts.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
}
#creating users and adding them to their respective groups

resource "aws_iam_user" "developer_users" {
  for_each = toset(var.developer_users)
  name     = each.key
  tags = {
    Team = "Developers"
  }
}

resource "aws_iam_user_group_membership" "developer_membership" {
  for_each = toset(var.developer_users)
  user     = each.key
  groups   = [aws_iam_group.developers.name]
}

resource "aws_iam_user" "operations_users" {
  for_each = toset(var.operations_users)
  name     = each.key
  tags = {
    Team = "Operations"
  }
}

resource "aws_iam_user_group_membership" "operations_membership" {
  for_each = toset(var.operations_users)
  user     = each.key
  groups   = [aws_iam_group.operations.name]
}

resource "aws_iam_user" "finance_users" {
  for_each = toset(var.finance_users)
  name     = each.key
  tags = {
    Team = "Finance"
  }
}

resource "aws_iam_user_group_membership" "finance_membership" {
  for_each = toset(var.finance_users)
  user     = each.key
  groups   = [aws_iam_group.finance.name]
}

resource "aws_iam_user" "analyst_users" {
  for_each = toset(var.analyst_users)
  name     = each.key
  tags = {
    Team = "Analysts"
  }
}

resource "aws_iam_user_group_membership" "analyst_membership" {
  for_each = toset(var.analyst_users)
  user     = each.key
  groups   = [aws_iam_group.analysts.name]
}

#Enabling MFA and setting up password policy

resource "aws_iam_account_password_policy" "password_policy" {
  minimum_password_length        = 12
  require_symbols                = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_lowercase_characters   = true
  allow_users_to_change_password = true
  hard_expiry                    = true
  max_password_age               = 90
  password_reuse_prevention      = 5
}
