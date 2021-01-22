provider "aws" {
  region = "ap-northeast-1"
}
variable "ami" {
  default = "ami-0e9208d1f0edf1344"
}
variable "vpc_security_group_ids" {
  default = "sg-095b074aaacd65d1c"
}

variable "region_postfix" {
  default = ["1a", "1c", "1d"]
}
variable "subnet_id" {
  default = ["subnet-0b03e0e88fb61e406", "subnet-07c65d25ce8dbaacf", "subnet-0a787f89954a2a193"]
}
variable "private_ip" {
  default = ["10.16.82.10", "10.16.84.10", "10.16.85.10"]
}
  
resource "aws_instance" "k8s-masters" {
  count = length( var.region_postfix )
  ami = var.ami
  instance_type = "t3.small"
  tags = {
    Name = "k8s-master-ne${format("%s", element(var.region_postfix, count.index))}"
  }
  availability_zone = "ap-northeast-${format("%s", element(var.region_postfix, count.index))}"
  subnet_id = element(var.subnet_id, count.index)
  private_ip = element(var.private_ip, count.index)
  ipv6_address_count = 1
  vpc_security_group_ids = [
    var.vpc_security_group_ids
  ]
  credit_specification {
    cpu_credits = "standard"
  }
}
