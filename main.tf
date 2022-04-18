provider "aws" {
  # Configuration options
  profile = "default"
  region  = "eu-central-1"
}

module "network" {
  source         = "./network"
  vpc_main_cidr  = var.vpc_main_cidr
  pub_sn_1_cidr  = var.pub_sn_1_cidr
  pub_sn_2_cidr  = var.pub_sn_2_cidr
  priv_sn_1_cidr = var.priv_sn_1_cidr
  priv_sn_2_cidr = var.priv_sn_2_cidr
  az-1           = var.az-1
  az-2           = var.az-2
}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo '${aws_instance.bastion.public_ip}'"
  }
}

data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/hello-python.zip"
}

resource "aws_lambda_function" "terraform_lambda_func" {
  filename      = "${path.module}/python/hello-python.zip"
  function_name = "lambda_test"
  role          = aws_iam_role.lambda_role.arn
  handler       = "hello-world.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]

  # Set S3 bucket name as SSM env variiable for lambda function
  environment {
    variables = {
      email  = "${var.email}"
      region = "${var.region}"
    }
  }
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.terraform_lambda_func.arn
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn
}
