data "archive_file" "handle_execution_file" {
  type        = "zip"
  source_file = "./functions/handle-execution/index.js"
  output_path = "./functions/handle-execution/index.zip"
}

resource "aws_lambda_function" "handle_execution" {
  filename         = "./functions/handle-execution/index.zip"
  function_name    = "handle-execution"
  handler          = "index.handler"
  memory_size      = 128
  timeout          = 5
  role             = var.inputs.modules.iam.handle_execution.arn
  source_code_hash = data.archive_file.handle_execution_file.output_base64sha256
  runtime          = "nodejs18.x"
}

output "handle_execution" {
  value = aws_lambda_function.handle_execution
}
