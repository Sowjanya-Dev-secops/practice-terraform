resource "aws_instance" "terraform" {
  ami           = data.aws_ami.joindevops.id
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  instance_type = "t3.micro"

  tags = {
    Name = "terraform1"
    terraform = "true"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all_datasource"
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


}