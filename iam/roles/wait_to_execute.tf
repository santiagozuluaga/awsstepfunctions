module "wait_to_execute" {
  source = "../../shared/role/states"

  name = "wait-to-execute"

  policy_arns = [
    module.policies.awsstepfunctions_cloudwatch_logs.arn
  ]
}

output "wait_to_execute" {
  value = module.wait_to_execute.role
}