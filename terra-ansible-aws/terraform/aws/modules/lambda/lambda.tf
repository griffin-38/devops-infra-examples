# IAM Role for Lambda
resource "aws_iam_role" "iam_for_lambda" {
  name = var.iam_role_name

  # Define permissions for AWS Lambda to assume this role
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


# AWS Lambda Function
resource "aws_lambda_function" "test_lambda" {
  # Path to the deployment package for your Lambda function
  filename         = "${path.module}/${var.lambda_function_name}_payload.zip"

  # Name of your Lambda function
  function_name    = var.lambda_function_name

  # IAM role ARN that Lambda assumes to execute your function
  role             = aws_iam_role.iam_for_lambda.arn

  # Entry point in your Lambda function code
  handler          = "exports.test"

  # Hash of your Lambda function's deployment package
  source_code_hash = base64sha256(file("${path.module}/${var.lambda_function_name}_payload.zip"))

  # Runtime environment for your Lambda function
  runtime          = "nodejs14.x"

  # Environment variables for your Lambda function
  environment = {
    variables = {
      foo = "bar"
    }
  }
}

