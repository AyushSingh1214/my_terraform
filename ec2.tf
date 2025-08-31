resource "aws_security_group" "wanderlust_sg" {
  name        = "wanderlust_sg"
  description = "allow ssh, http, https"
  vpc_id      = aws_vpc.wanderlust_vpc.id

  ingress = [
    for port in [22, 80, 443, 8080, 9090, 8000] : {
      description      = "allow inbound"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }

  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wanderlust_sg"
  }
}

resource "aws_instance" "jenkins-master" {

  ami                         = var.ami
  instance_type               = "t2.medium" // var.instance_type
  subnet_id                   = aws_subnet.wanderlust_subnet.id
  vpc_security_group_ids      = [aws_security_group.wanderlust_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  user_data                   = templatefile("./jenkins.sh", {})

  tags = {
    Name = "jenkins-master"
  }
}

resource "aws_instance" "jenkins-agent" {

  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.wanderlust_subnet.id
  vpc_security_group_ids      = [aws_security_group.wanderlust_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  user_data                   = templatefile("./java.sh", {})
  tags = {
    Name = "jenkins-agent"
  }
}