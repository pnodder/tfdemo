# Reusable lambda module
data "archive_file" "lambda_zip" {
  type = "zip"
  source_dir  = "${path.module}/src/get"
  output_path = "${path.module}/get.zip"
}

resource "aws_s3_object" "lambda_app" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key    = "get.zip"
  source = data.archive_file.lambda_zip.output_path
  etag = filemd5(data.archive_file.lambda_zip.output_path)
}

resource "aws_lambda_function" "app" {
  function_name = var.name
  description   = "apigwy-http-api serverlessland pattern"

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = aws_s3_object.lambda_app.key

  runtime = "python3.8"
  handler = "app.handle"

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  role       = aws_iam_role.lambda_exec.arn
  depends_on = [aws_cloudwatch_log_group.lambda_log]
}

resource "aws_cloudwatch_log_group" "lambda_log" {
  name              = "/aws/lambda/${var.name}"
  retention_in_days = 30
}

# Each resource block describes one or more infrastructure objects
resource "aws_s3_bucket" "lambda_bucket" {
  bucket_prefix = "tfdemo"
  force_destroy = true
}

resource "aws_iam_role" "lambda_exec" {
  name = "serverless_lambda_2"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}