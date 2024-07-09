resource "aws_iam_policy" "wait_to_execute" {

  name   = "wait-to-execute"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "lambda:InvokeFunction"
      ],
      "Resource": [
        "arn:aws:lambda:${var.inputs.config.region}:${var.inputs.config.account_id}:function:handle-execution"
      ]
    }
  ]
}
EOF
}

output "wait_to_execute" {
  value = aws_iam_policy.wait_to_execute
}
