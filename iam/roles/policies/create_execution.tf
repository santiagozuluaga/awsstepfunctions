resource "aws_iam_policy" "create_execution" {

  name   = "create-execution"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "states:StartExecution"
      ],
      "Resource": "arn:aws:states:${var.inputs.config.region}:${var.inputs.config.account_id}:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

output "create_execution" {
  value = aws_iam_policy.create_execution
}
