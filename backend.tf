terraform {
  backend "s3" {
    bucket         = "iti-private-bucket"
    key            = "terraform/keys/"
    region         = "eu-central-1"
    dynamodb_table = "TERRAFORM_STATE_LOCK"
  }
}
