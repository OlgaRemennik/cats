provider "aws" {
  region = "us-east-2"
}

module "cats_ec2" {
  source    = "../modules/ec2"
}

output "minikube_credentials" {
  value = module.cats_ec2.minikube_credentials
}
