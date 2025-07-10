terraform {
  backend "s3" {
    bucket = "terraform-state-bharath-SM-why563"
    key    = "secrets/dev/terraform.tfstate"
    region = "us-east-2"
  }
}
