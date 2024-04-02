# Use this data source to get the access to the effective
# Account ID, User ID, and ARN in which Terraform is authorized.
data "aws_caller_identity" "current" {}

# from Stack Overflow
data "aws_iam_policy_document" "boundary" {
  statement {
    effect = "Deny"
    actions = [
      "cloudtrail:StopLogging"
    ]

    resources = [
      "arn:aws:iam:::${data.aws_caller_identity.current.account_id}:policy/POLICY-NAME",
    ]
  }
}
