resource "aws_instance" "terraform" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = var.ec2_tags

}


resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_all"
  }
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocal
    cidr_blocks      = var.cidr
  }
  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocal
    cidr_blocks      = var.cidr
  }
}