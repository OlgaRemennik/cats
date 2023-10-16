resource "aws_security_group" "cats_security_group" {
  name_prefix = "cats-security-group-"

  vpc_id = aws_default_vpc.default.id

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_laptop_cidr]  // Use your laptop's public IP address
  }
}

resource "aws_default_vpc" "default" {}

resource "aws_instance" "cats_instance" {
  ami               = "ami-024e6efaf93d85776"  # Ubuntu 22.04 LTS
  instance_type     = "t2.large"
  availability_zone = "us-east-2a"
  key_name          = var.key_name
  vpc_security_group_ids = [aws_security_group.cats_security_group.id]

  user_data = <<-EOF
    #!/bin/bash
    # Install Docker
    sudo apt update
    sudo apt install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker

    # Add user to docker group (optional, for non-root access to Docker)
    sudo usermod -aG docker ubuntu

    # Install Minikube
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

    # Start Minikube
    minikube start --driver=docker --kubernetes-version=v1.22.2

    # Optional: Add user to minikube group for non-root access
    sudo usermod -aG minikube ubuntu
    EOF

  tags = {
    Name = "cats-instance"
  }
}

output "minikube_credentials" {
  value = aws_instance.cats_instance.public_ip
}
