data "archive_file" "create_execution_file" {
  type        = "zip"
  source_file = "./functions/create-execution/index.js"
  output_path = "./functions/create-execution/index.zip"
}

resource "aws_lambda_function" "create_execution" {
  filename         = "./functions/create-execution/index.zip"
  function_name    = "create-execution"
  handler          = "index.handler"
  memory_size      = 128
  timeout          = 5
  role             = var.inputs.modules.iam.create_execution.arn
  source_code_hash = data.archive_file.create_execution_file.output_base64sha256
  runtime          = "nodejs18.x"

  environment {
    variables = {
      STATE_MACHINE_ARN = "arn:aws:states:*:*:stateMachine:WaitToExecute"
    }
  }
}

output "create_execution" {
  value = aws_lambda_function.create_execution
}
