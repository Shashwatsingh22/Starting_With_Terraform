provider "aws" {

    region = "ap-south-1"
    access_key = "my_access_key"
    secret_key = "my_secret_key"
 
}

resource "aws_instance" "aws" {

#RedHat
    ami = "ami-010aff33ed5991201"
    instance_type = "t2.micro"
    tags = {

        Name = "testing_by_tf"

    }
}