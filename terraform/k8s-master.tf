provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "k8s-master-ne1a" {
  ami = "ami-005eef3e36f4158d2"
  instance_type = "t2.small"
  availability_zone = "ap-northeast-1a"
  subnet_id = "subnet-0b03e0e88fb61e406"
  private_ip = "10.16.82.10"
  ipv6_address_count = 1
  security_groups = [
    "sg-095b074aaacd65d1c"
  ]
  tags = {
    Name = "k8s-master-ne1a"
  }
}

resource "aws_instance" "k8s-master-ne1c" {
  ami = "ami-005eef3e36f4158d2"
  instance_type = "t2.small"
  availability_zone = "ap-northeast-1c"
  subnet_id = "subnet-07c65d25ce8dbaacf"
  private_ip = "10.16.84.10"
  ipv6_address_count = 1
  security_groups = [
    "sg-095b074aaacd65d1c"
  ]
  tags = {
    Name = "k8s-master-ne1c"
  }
}
resource "aws_instance" "k8s-master-ne1d" {
  ami = "ami-005eef3e36f4158d2"
  instance_type = "t2.small"
  availability_zone = "ap-northeast-1d"
  subnet_id = "subnet-0a787f89954a2a193"
  private_ip = "10.16.85.10"
  ipv6_address_count = 1
  security_groups = [
    "sg-095b074aaacd65d1c"
  ]
  tags = {
    Name = "k8s-master-ne1d"
  }
}
