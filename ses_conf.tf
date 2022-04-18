resource "aws_ses_email_identity" "simple_email_identity" {
  email = var.email
}
