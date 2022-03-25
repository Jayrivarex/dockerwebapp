variable "my_access_key" {
  description = "Access-key-for-AWS"
  default = "no_access_key_value_found"
}
 
variable "my_secret_key" {
  description = "Secret-key-for-AWS"
  default = "no_secret_key_value_found"
}
 
provider "aws" {
	region = "us-west-2"
	access_key = var.my_access_key
	secret_key = var.my_secret_key
}
 
resource "aws_instance" "example" {
	ami = "${var.ami-amazon2-ohio}"
	instance_type = "t3a.nano"
 
	user_data = <<-EOF
	        #!/bin/bash
		    sudo yum update -y
		    sudo yum -y install httpd -y
		    sudo service httpd start
		    echo "Hello world from EC2 $(hostname -f)" > /var/www/html/index.html
		    EOF
				
	tags = {
		Name = "My first EC2 using Terraform"
	}
	vpc_security_group_ids = [aws_security_group.instance.id]
}
 
resource "aws_security_group" "instance" {
	name = "terraform-tcp-security-group"
 
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["11.22.33.44/0"]
	}
 
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}