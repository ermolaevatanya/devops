<<<<<<< HEAD
qq#terraform {
=======
#terraform {
>>>>>>> 21a50bf (diplom project)
#  backend "s3" {
#    bucket         = "ermolaevabucket"
#    key            = "terra-backend/terraform.tfstate"
#    region         = "us-east-1"
#    dynamodb_table = "terraform-state-locking"
#  }
#}

provider "aws" {
 region = "us-east-1"
}
