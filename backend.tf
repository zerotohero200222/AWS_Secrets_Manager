terraform {
  backend "s3" {
    bucket = "terraform-secretmanager-state"
    key    = "secrets/dev/terraform.tfstate"
    region = "us-east-2"
  }
}
