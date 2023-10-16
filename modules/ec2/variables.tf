variable "key_name" {
  description = "Name of the key pair to use for the EC2 instance"
  type        = string
  default     = "olya_key"
}

variable "subnet_id" {
  description = "ID of the subnet where the EC2 instance will be launched"
  type        = string
  default = "subnet-0a41ae40c396ff946"
}

variable "my_laptop_cidr" {
  description = "CIDR block for your laptop's IP address"
  type        = string
  default     = "82.144.214.112/32"  # Replace with your actual IP or CIDR block
}

