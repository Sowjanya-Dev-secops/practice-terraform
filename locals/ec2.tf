resource "aws_instance" "example" {
  ami      = local.ami_id
   # ami           = data.aws_ami.example.id
#   instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
 # count = length(var.instance_name)
  for_each = var.instance_name
  instance_type = each.value
  tags = {
    Name = each.key
    terraform = true
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls_par_tr"
  description = "Allow TLS inbound traffic and all outbound traffic"
 

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls_par"
  }
}
