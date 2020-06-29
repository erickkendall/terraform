data "aws_iam_policy_document" "snapshot" {
  statement {
    sid = "1"
    actions = [
      "ec2:DeleteSnapshot",
      "ec2:CreateSnapshots",
      "ec2:CreateSnapshot"
    ]
    resources = [
      "arn:aws:ec2:*:*:instance/*",
      "arn:aws:ec2:*:*:snapshots",
      "arn:aws:ec2:*:*:volume/*"
    ]
  }
  statement {
    actions = [
      "ec2:DescribeImages",
      "ec2:DeregisterImage",
      "ec2:DescribeInstances",
      "ec2:DescribeSnapshotAttribute",
      "ec2:DescribeInstanceAttribute",
      "ec2:DescribeImageAttribute",
      "logs:*",
      "ec2:CreateImage",
      "ec2:DescribeSnapshots",
      "ec2:DescribeInstanceCreditSpecifications",
      "ec2:DescribeInstanceStatus"
    ]
    resources = ["*"]
  }
}
resource "aws_iam_policy" "snapshot_policy" {
  name   = "snapshot_policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.snapshot.json}"
}
