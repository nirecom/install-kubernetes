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
variable "tag_Name" {
  default = ["k8s-master-ne1a", "k8s-master-ne1c", "k8s-master-ne1d"]
}
variable "private_ip" {
  default = ["10.16.82.10", "10.16.84.10", "10.16.85.10"]
}

resource "aws_instance" "k8s-masters" {
  count = length( var.tag_Name )
  ami = var.ami
  instance_type = var.instance_type
  tags = {
    Name = element(var.tag_Name, count.index)
  }
  availability_zone = "ap-northeast-1a"
  subnet_id = var.subnet_id
  private_ip = element(var.private_ip, count.index)
  ipv6_address_count = 1
  vpc_security_group_ids = [
    var.vpc_security_group_ids
  ]
  credit_specification {
    cpu_credits = var.cpu_credits
  }
}
