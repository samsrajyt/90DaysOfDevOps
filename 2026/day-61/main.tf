terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}



provider "aws" {

  region = "us-west-2"
}



resource "aws_s3_bucket" "my_bucket" {

  bucket = "my-bucket-s3-josh"


}

resource aws_instance terra-instance {
 ami = "ami-03db3415e6524c5d2"
 instance_type = "t3.micro"

 tags={
 Name = "TerraWeek-Modified"
 }

 }
