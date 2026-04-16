provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "masternode" {
  ami           = "ami-07216ac99dc46a187"
  instance_type = "t2.medium"
  key_name      = "k8s-key"
  vpc_security_group_ids = ["sg-08daf15b4d9f9f6b8"]

  tags = {
    Name = "master"
  }
}

resource "aws_instance" "workernode1" {
  ami           = "ami-07216ac99dc46a187"
  instance_type = "t2.medium"
  key_name = "k8s-key"

  vpc_security_group_ids = ["sg-0e63ed3ce1e656112"]

  tags = {
    Name = "worker_node_1"
  }
}

resource "aws_instance" "workernode2" {
    ami = "ami-07216ac99dc46a187"
    instance_type = "t2.medium"
    key_name = "k8s-key"

    vpc_security_group_ids = ["sg-0e63ed3ce1e656112"]

    tags = {
        Name = "worker_node_2"
    }
}


output "master_ip" {
  value = aws_instance.masternode.public_ip
}

output "worker1_ip" {
  value = aws_instance.workernode1.public_ip
}

output "worker2_ip" {
  value = aws_instance.workernode2.public_ip
}