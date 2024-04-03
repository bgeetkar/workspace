terraform {
  backend "s3" {
    bucket = "paltform-code-terraform-file"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
