resource "aws_sfn_state_machine" "WaitToExecute" {
  name     = "WaitToExecute"
  role_arn = var.inputs.modules.iam.wait_to_execute.arn

  definition = <<EOF
{
  "Comment": "Wait until TTL to execute lambda",
  "StartAt": "Wait",
  "States": {
    "Wait": {
      "Type": "Wait",
      "TimestampPath": "$.ttl",
      "Next": "ExecuteLambda"
    },
    "ExecuteLambda": {
      "Type": "Task",
      "Resource": "${var.inputs.modules.lambda.functions.handle_execution.arn}",
      "End": true
    }
  }
}
EOF
}