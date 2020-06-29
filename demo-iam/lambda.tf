provider "aws" {
  region = "us-east-1"
}

resource "aws_lambda_function" "snapshot" {
  function_name = "Snapshot"

  # The bucket name as created earlier with "aws s3api create-bucket"
  s3_bucket = "brouhaha"
  s3_key    = "snapshot.zip"

  # "main" is the filename within the zip file (main.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "main.handler"
  runtime = "python3.7"

  role = aws_iam_role.lambda_exec.arn

}

resource "aws_iam_role" "lambda_exec" {
  name = "serverless_example_lambda"

  assume_role_policy = <<EOF
 {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:DeleteSnapshot",
                "ec2:CreateSnapshots",
                "ec2:CreateSnapshot"
            ],
            "Resource": [
                "arn:aws:ec2:*:*:instance/*",
                "arn:aws:ec2:*:*:snapshot/*",
                "arn:aws:ec2:*:*:volume/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
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
            ],
            "Resource": "*"
        }
    ]
 }
 EOF
}
