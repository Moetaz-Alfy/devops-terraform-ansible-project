output "role_arn" {
  value = aws_iam_role.eks_access_role.arn
}

output "role_name" {
  value = aws_iam_role.eks_access_role.name
}

output "policy_arn" {
  value = aws_iam_policy.eks_policy.arn
}
