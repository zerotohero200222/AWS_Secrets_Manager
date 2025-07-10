terraform {
  backend "s3" {
    bucket = "terraform-state-bharath-sm-why563"
    key    = "secrets/dev/terraform.tfstate"
    region = "us-east-2"
  }
}
