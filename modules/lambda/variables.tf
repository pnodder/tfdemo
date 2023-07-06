variable "s3_bucket_prefix" {
  description = "S3 bucket prefix for lambda code"
  type        = string
  default     = "tfdemo-lambda-src"
}

variable "name" {
  description = "name of lambda function"
  type        = string
  default     = "tfdemo-get"
}

variable "log_retention" {
  description = "lambda log retention in days"
  type        = number
  default     = 7
}