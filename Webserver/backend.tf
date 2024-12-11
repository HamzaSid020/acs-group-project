terraform {
  backend "s3" {
    bucket = "aws-bucket-dhana1"         
    key    = "webserver/terraform.tfstate"  
    region = "us-east-1"              
  }
}
