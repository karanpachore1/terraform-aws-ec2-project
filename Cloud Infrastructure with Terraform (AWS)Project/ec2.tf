resource "aws_instance" "web_server" {
  ami           = "ami-0a145236ee857bedd"  # Amazon Linux 2 (UK)
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.web_sg.id]

  tags = {
    Name = "Terraform-EC2"
  }
}