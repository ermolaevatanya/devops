terraform {
  backend "s3" {
    bucket         = "ermolaevabucket"
    key            = "terra-backend/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
}
#terraform {
#  backend "local" {}
#}

provider "aws" {
 region = "us-east-1"
}
