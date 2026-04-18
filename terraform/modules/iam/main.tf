# IAM Group
resource "aws_iam_group" "devops" {
  name = "devops"
}

# IAM Users
resource "aws_iam_user" "users" {
  for_each = toset(["user1", "user2"])
  name     = each.value
}

# Add Users to Group
resource "aws_iam_group_membership" "devops_members" {
  name  = "devops-membership"
  group = aws_iam_group.devops.name
  users = [for u in aws_iam_user.users : u.name]
}

# IAM Role
resource "aws_iam_role" "eks_access_role" {
  name = "eks-access-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { AWS = "arn:aws:iam::${var.account_id}:root" }
      Action    = "sts:AssumeRole"
    }]
  })
}

# IAM Policy
resource "aws_iam_policy" "eks_policy" {
  name = "eks-access-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["eks:DescribeCluster", "eks:ListClusters", "eks:AccessKubernetesApi"]
      Resource = "*"
    }]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "attach_to_role" {
  role       = aws_iam_role.eks_access_role.name
  policy_arn = aws_iam_policy.eks_policy.arn
}

# Attach Policy to Group
resource "aws_iam_group_policy_attachment" "attach_to_group" {
  group      = aws_iam_group.devops.name
  policy_arn = aws_iam_policy.eks_policy.arn
}
