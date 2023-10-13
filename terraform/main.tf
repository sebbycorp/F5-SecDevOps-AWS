terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.21.0"
    }
  }

  required_version = ">=1.5.0"

}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "f5-secdevops-aws-terraform-state"
    key            = "secdevops-tfstate-s3-bucket"
    region         = "us-east-1"
    dynamodb_table = "f5-secdevops-aws-state-lock-dynamo"
  }
}

## ONLY TO BUILD BUCKET AT FIRST LAUNCH 
resource "aws_s3_bucket" "terraform_state" {
  bucket = "f5-secdevops-aws-terraform-state"
}


resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "f5-secdevops-aws-terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
  tags = {
    Name = "DynamoDB f5-secdevops-aws State"
  }
  attribute {
    name = "LockID"
    type = "S"
  }
}