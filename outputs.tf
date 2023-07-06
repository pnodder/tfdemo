# Output values make information about your infrastructure available on the command line, and can expose information
# for other Terraform configurations to use. Output values are similar to return values in programming languages.
output "apigw_url" {
  description = "URL for API Gateway stage"
  value = aws_apigatewayv2_api.lambda.api_endpoint
}