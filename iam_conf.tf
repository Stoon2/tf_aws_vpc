resource "aws_iam_role" "lambda_role" {
  name               = "lambda_test_Role"
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
resource "aws_iam_policy" "iam_policy_for_lambda_ses" {

  name        = "aws_iam_policy_for_terraform_aws_lambda_role_ses"
  path        = "/"
  description = "AWS IAM Policy for managing aws lambda role ses"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ses:SendEmail",
                "ses:SendRawEmail"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
resource "aws_iam_policy" "iam_policy_for_lambda_s3" {

  name        = "aws_iam_policy_for_terraform_aws_lambda_role_s3"
  path        = "/"
  description = "AWS IAM Policy for managing aws lambda role s3"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda_ses.arn
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role_s3" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda_s3.arn
}
