terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }



backend "s3" {
  bucket         = "ba2512-s3-petstore-lois"   # your S3 bucket name
  key            = "terraform_states/terraform.tfstate"    # path in bucket
  region         = "us-east-1"
  dynamodb_table = "tf-demo-locks"                # DynamoDB table for locking
  encrypt        = true
}


}

provider "aws" {
  region = "us-east-1"
}

resource "local_file" "hello" {
  filename = "hello.txt"
  content  = "How is everything going"
}

resource "aws_s3_object" "snowflake_data" {
  bucket  = "ba2512-s3-petstore-lois"
  key     = "terraform_states/snowflake_data/"
  content = ""
}