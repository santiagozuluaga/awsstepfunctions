module "create_execution" {
  source = "../../shared/role/lambda"

  name = "create-execution"

  policy_arns = [
    module.policies.create_execution.arn,
    module.policies.awsstepfunctions_cloudwatch_logs.arn
  ]
}

output "create_execution" {
  value = module.create_execution.role
}