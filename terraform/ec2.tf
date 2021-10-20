resource "aws_network_interface" "default" {
  subnet_id = aws_subnet.public.id
  security_groups = [
    aws_security_group.default_ec2.id,
  ]

  tags = {
    Name        = "${var.environment}-default-network-interface"
    Environment = var.environment
  }
}

resource "aws_instance" "default" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.nano"

  network_interface {
    network_interface_id = aws_network_interface.default.id
    device_index         = 0
  }


  tags = {
    Name        = "${var.environment}-default"
    Environment = var.environment
  }
}
