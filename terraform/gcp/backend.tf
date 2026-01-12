terraform {
  backend "gcs" {
    bucket  = "devops-assignment-tf-state-gcp" # REPLACE WITH UNIQUE BUCKET NAME
    prefix  = "terraform/state"
  }
}
