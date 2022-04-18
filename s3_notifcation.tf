resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.s3_bucket
  lambda_function {
    lambda_function_arn = aws_lambda_function.terraform_lambda_func.arn
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]
    # filter_prefix       = "*"
    # filter_suffix       = ".log"
  }
  depends_on = [aws_lambda_permission.allow_bucket]
}
