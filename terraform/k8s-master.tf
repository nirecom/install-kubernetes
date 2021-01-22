provider "aws" {
  region = "ap-northeast-1"
}
variable "ami" {
  default = "ami-005eef3e36f4158d2"
}
variable "instance_type" {
  default = "t3.small"
}
variable "subnet_id" {
  default = "subnet-0b03e0e88fb61e406"
}
variable "vpc_security_group_ids" {
  default = "sg-095b074aaacd65d1c"
}
variable "cpu_credits" {
  default = "standard"
}

resource "aws_instance" "k8s-master-ne1a" {
  ami = var.ami
  instance_type = var.instance_type
  availability_zone = "ap-northeast-1a"
  subnet_id = var.subnet_id
  private_ip = "10.16.82.10"
  ipv6_address_count = 1
  vpc_security_group_ids = [
    var.vpc_security_group_ids
  ]
  tags = {
    Name = "k8s-master-ne1a"
  }
  credit_specification {
    cpu_credits = var.cpu_credits
  }
}
