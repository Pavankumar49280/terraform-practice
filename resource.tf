locals {
  itype = {
    dev  = "t3.micro"
    test = "c7i-flex.large"
    prod = "m7i-flex.large"
  }
}
resource "aws_instance" "myinstance" {
  tags = {
    Name = "${terraform.workspace}-manual-server"

  }

  ami                    = "ami-0532be01f26a3de55"
  instance_type          = local.itype[terraform.workspace]
  key_name               = "devops"
  vpc_security_group_ids = [aws_security_group.terrasg.id]
  root_block_device {
    volume_size = 9
  }
}


resource "aws_instance" "myserver-2" {
  tags = {
    name = "pavan"
  }
  provider               = aws.hyderabad
  ami                    = "ami-0532be01f26a3de55"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.terrasg.id]
  root_block_device {
    volume_size = 9
  }
}

