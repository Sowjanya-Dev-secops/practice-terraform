resource "aws_instance" "terraform" {
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  instance_type = "t3.micro"

  tags = {
    Name = "terraform1"
    terraform = "true"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
    on_failure = continue
  }
    provisioner "local-exec" {
    command = "echo The instance is destroyed "
    when = destroy
  }

    connection {
    type        = "ssh"
    user        = "ec2-user" # Or appropriate user for your AMI
    password    = "DevOps321"
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
  
  provisioner "remote-exec" {
    inline = [
      " sudo systemctl stop nginx ",
      "echo 'successfully stopped nginx server'"
    ]
    when = destroy
  }

}

resource "aws_security_group" "allow_all" {
  name        = "allow_all_localpro"
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