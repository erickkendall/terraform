resource "aws_iam_role" "test_role" {
  name = "test_role"
  permissions_boundary = data.aws_iam_policy_document.boundary.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_user" "example" {
  for_each = toset(["tucker", "annie", "josh"])
  name     = each.value
}

# Create IAM user
resource "aws_iam_user" "erickkendall" {
  name = "erickkendall"
}

# Create an IAM group
resource "aws_iam_group" "terraform-developers" {
  name = "terraform-developers"
}
resource "aws_iam_group_membership" "erickkendall-membership" {
  name  = aws_iam_user.erickkendall.name
  users = [aws_iam_user.erickkendall.name]
  group = aws_iam_group.terraform-developers
}
# Full RDS access using a managed policy
data "aws_iam_policy" "rds-full-access" {
  arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}
# Custom EC2 policy
data "aws_iam_policy_document" "ec2_instance_actions" {
  statement {
    actions = [
      "ec2:StartInstance",
      "ec2:StopInstance",
    ]
    resources = [
      "arn:aws:ec2:*:*:instance/*",
    ]
  }
}
resource "aws_iam_policy" "ec2_instance_actions" {
  name   = "ec2_instance_actions"
  policy = data.aws_iam_policy_document.ec2_instance_actions.json
}

resource "aws_iam_group_policy_attachment" "terraform-developers_rds_full_access" {
  policy_arn = data.aws_iam_policy.rds-full-access.id
  group      = aws_iam_group.terraform-developers.name
}
resource "aws_iam_group_policy_attachment" "developer_ec2-instance-actions" {
  policy_arn = aws_iam_policy.ec2_instance_actions.id
  group      = aws_iam_group.terraform-developers.name
}
