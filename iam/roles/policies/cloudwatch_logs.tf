resource "aws_iam_policy" "awsstepfunctions_cloudwatch_logs" {

  name   = "awsstepfunctions-cloudwatch-logs"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:${var.inputs.config.region}:${var.inputs.config.account_id}:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}


output "awsstepfunctions_cloudwatch_logs" {
  value = aws_iam_policy.awsstepfunctions_cloudwatch_logs
}