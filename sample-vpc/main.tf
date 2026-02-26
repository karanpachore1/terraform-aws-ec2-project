# terraform {
#   backend "s3" {
#     bucket = "tf-bucketkp"
#     region = "ap-south-1"
#     key = "tfstate"
#   }
# }



# provider "aws" {
#   region = var.region
# }

# resource "aws_vpc" "myvpc" {
#   cidr_block = var.vpc_cidr
#   tags = {
#     Name = "${var.project}-vpc"
#     env = "var.env"
#   }
# }

# resource "aws_subnet" "pvtmysubnet" {
#   vpc_id = aws_vpc.myvpc.id
#   availability_zone = var.az_private
#   cidr_block = var.private_subnet_cidr
#   tags = {
#     Name = "${var.project}-vpc"
#     env = "var.env"
#   }
# }

# resource "aws_subnet" "pubsubnet" {
#   vpc_id = aws_vpc.myvpc.id
#   availability_zone = var.az_public
#   cidr_block = var.public_subnet_cidr
#   map_public_ip_on_launch = true
#   tags = {
#     Name = "${var.project}-vpc"
#     env = "var.env"
#   }
# }

# resource "aws_internet_gateway" "myigw" {
#   vpc_id = aws_vpc.myvpc.id

#  tags = {
#     Name = "${var.project}-vpc"
#     env = "var.env"
#   }
# }
# resource "aws_default_route_table" "myroute" {
#   default_route_table_id = aws_vpc.myvpc.default_route_table_id
#  route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.myigw.id
#  } 
#  tags = {
#     Name = "${var.project}-vpc"
#     env = "var.env"
#   }
# }

# resource "aws_security_group" "sg1" {
#   name = "${var.project}-sg"
#   description = "Allow httpd service"
#   vpc_id = aws_vpc.myvpc.id

#   ingress {
#     protocol     = "TCP"
#     from_port    = 80
#     to_port      = 80
#     cidr_blocks  = ["0.0.0.0/0"]

#   }
#   ingress {
#     protocol     = "TCP"
#     from_port    = 22
#     to_port      = 22
#     cidr_blocks  = ["0.0.0.0/0"]

#   }
#   egress {
#        from_port = 0
#        to_port   = 0
#        protocol  = "-1"
#        cidr_blocks = ["0.0.0.0/0"]
#   }
  
#   tags = {
#     Name = "${var.project}-vpc"
#     env = "var.env"
#   }
  
# }
# resource "aws_instance" "pvt_instance" {
#   ami = var.ami
#   instance_type = var.instance_type
#   key_name = var.key_pair
#   tags = var.pvt_tags
#   subnet_id = aws_subnet.pvtmysubnet.id
#   vpc_security_group_ids = [aws_security_group.sg1.id]

# }
# resource "aws_instance" "pub_instance" {
#   ami = var.ami
#   instance_type = var.instance_type
#   key_name = var.key_pair
#   tags = var.pub_tags
#   subnet_id = aws_subnet.pubsubnet.id
#   vpc_security_group_ids = [aws_security_group.sg1.id]



#   user_data = <<-EDF
#   #!/bin/bash
#   sudo apt-get update
#   sudo apt-get install apache2 -y
#   sudo systemctl start apache2
#   sudo systemctl enable apache2
#   echo "<h1>welcome to terraform</h1>" > /var/www/html/index.html
#   EDF
#   depends_on = [ aws_security_group.sg1 ]
# }


# # resource "aws_instance" "pub_instance" {
# #   ami = var.ami
# #   instance_type = var.instance_type
# #   key_name = var.key_pair
# #   tags = var.pub_tags
# #   subnet_id = aws_subnet.pubsubnet.id
# #   vpc_security_group_ids = [aws_security_group.sg1]

  















# # provider "aws" {
# #   region = "ap-south-1"
# # }

# # resource "aws_vpc" "myvpc" {
# #   cidr_block = "10.0.0.0/16"   # FIXED
# #   tags = {
# #     Name = "myvpc"
# #   }
# # }

# # resource "aws_subnet" "pvtmysubnet" {
# #   vpc_id = aws_vpc.myvpc.id
# #   availability_zone = "ap-south-1a"
# #   cidr_block = "10.0.1.0/24"  # FIXED
# #   map_public_ip_on_launch = false
# #   tags = {
# #    Name = "mypvtsubnet"
# #  }
# # }

# # resource "aws_subnet" "pubsubnet" {
# #   vpc_id = aws_vpc.myvpc.id
# #   availability_zone = "ap-south-1b"
# #   cidr_block = "10.0.2.0/24"  # FIXED
# #   map_public_ip_on_launch = true
# #   tags = {
# #    Name = "mypubsubnet"
# #  }
# # }

# # resource "aws_internet_gateway" "myigw" {
# #   vpc_id = aws_vpc.myvpc.id
# #   tags = {
# #    Name = "myigw"
# #  }
# # }

# # resource "aws_default_route_table" "myroute" {
# #   default_route_table_id = aws_vpc.myvpc.default_route_table_id

# #   route {
# #     cidr_block = "0.0.0.0/0"
# #     gateway_id = aws_internet_gateway.myigw.id
# #   }

# #   tags = {
# #    Name = "myroute"
# #   }
# # }
