# Input variables let you customize aspects of Terraform modules without altering the module's own source code.
# This functionality allows you to share modules across different Terraform configurations,
# making your module composable and reusable.
# When you declare variables in the root module of your configuration,
# you can set their values using CLI options and environment variables. When you declare them in child modules,
# the calling module should pass values in the module block.
variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "eu-west-1"
}

variable "aws_profile" {
  description = "AWS profile for all resources."
  type        = string
}

variable "s3_bucket_prefix" {
  description = "S3 bucket prefix for lambda code"
  type        = string
  default     = "tfdemo-lambda-src"
}

variable "lambda_name" {
  description = "name of lambda function"
  type        = string
  default     = "tfdemo-get"
}

variable "lambda_log_retention" {
  description = "lambda log retention in days"
  type        = number
  default     = 7
}

variable "apigw_log_retention" {
  description = "api gw log retention in days"
  type        = number
  default     = 7
}