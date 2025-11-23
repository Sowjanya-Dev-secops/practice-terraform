resource "aws_instance" "terraform" {
  ami           = "ami-09c813fb71547fc4f"
  for_each = var.instances
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  
  instance_type = each.value

  tags = {
    Name = each.key
    terraform = "true"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-all-security"
  }
  
}
