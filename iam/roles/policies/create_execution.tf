resource "aws_iam_policy" "create_execution" {

  name   = "create-execution"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "states:StartExecution"
      ],
      "Resource": "arn:aws:states:${var.inputs.config.region}:${var.inputs.config.account_id}:*"
    }
  ]
}
EOF
}

output "create_execution" {
  value = aws_iam_policy.create_execution
}
