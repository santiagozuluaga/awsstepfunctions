module "handle_execution" {
  source = "../../shared/role"

  name = "handle-execution"

  policy_arns = [
    module.policies.awsstepfunctions_cloudwatch_logs.arn
  ]
}

output "handle_execution" {
  value = module.handle_execution.role
}