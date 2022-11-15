provider "aws" {
region = "us-east-2"
}

resource "aws_instance" "terraform_ec2" {
ami = "ami-089a545a9ed9893b6"
instance_type = "t2.micro"
tags = {
Name = "Terraform EC2 Instance"
}
vpc_security_group_ids = [aws_security_group.ec2_instance.id]
}

resource "aws_security_group" "ec2_instance" {
name = "terraform-security-group"

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}