resource "aws_security_group" "allow_all" {
  name        = "roboshop_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  dynamic "ingress" {
    for_each = toset(var.ingress_port)
    content{
     from_port        = ingress.value
     to_port          = ingress.value
     protocol         = "tcp"
     cidr_blocks      = ["0.0.0.0/0"]
    }
    
  }
  tags = {
    name = "roboshop_sg"
  }


}