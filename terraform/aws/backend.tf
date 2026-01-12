terraform {
  backend "s3" {
    bucket         = "devops-assignment-tf-state" # REPLACE WITH UNIQUE BUCKET NAME
    key            = "aws/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
