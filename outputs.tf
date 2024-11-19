# Output for Developer IAM Group
output "developer_group_name" {
  value       = aws_iam_group.developers.name
  description = "The name of the Developers IAM Group."
}

# Output for Operations IAM Group
output "operations_group_name" {
  value       = aws_iam_group.operations.name
  description = "The name of the Operations IAM Group."
}

# Output for Finance IAM Group
output "finance_group_name" {
  value       = aws_iam_group.finance.name
  description = "The name of the Finance IAM Group."
}

# Output for Analyst IAM Group
output "analyst_group_name" {
  value       = aws_iam_group.analysts.name
  description = "The name of the Analysts IAM Group."
}

# Output for IAM Users
output "iam_user_names" {
  value       = concat(
    keys(aws_iam_user.developer_users),
    keys(aws_iam_user.operations_users),
    keys(aws_iam_user.finance_users),
    keys(aws_iam_user.analyst_users)
  )
  description = "A list of all IAM user names created by this configuration."
}

# Output for Password Policy
output "password_policy_details" {
  value       = aws_iam_account_password_policy.password_policy
  description = "The details of the IAM account password policy."
}
