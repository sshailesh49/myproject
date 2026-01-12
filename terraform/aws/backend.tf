terraform {
  backend "s3" {
    bucket         = "devops-assignment-tf-state-07ec8aea06af7700" # REPLACE WITH UNIQUE BUCKET NAME
    key            = "aws/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
