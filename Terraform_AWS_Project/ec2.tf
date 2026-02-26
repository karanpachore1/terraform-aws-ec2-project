resource "aws_instance" "web_server" {
  ami                    = "ami-0ff91eb5c6fe7cc86" # Amazon Linux 2 (eu-west-2)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Terraform-EC2"
  }
}