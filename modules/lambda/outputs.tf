# Output values for users of modules
output "invoke_arn" {
  description = "invoke arn"
  value       = aws_lambda_function.app.invoke_arn
}

output "name" {
  description = "function name"
  value       = aws_lambda_function.app.function_name
}

