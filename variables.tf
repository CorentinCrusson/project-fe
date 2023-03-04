### Project Settings

variable "project" {
  default = "corentin-test"
}

variable "instance_count" {
  description = "Number of instances to launch"
  default     = 3
  type        = number
}

### VPC settings

variable "network_uuid" {
  default = "333d3ef2-b407-41fc-b539-9248f0cb5a30"
}

variable "vpc_cidr" {
  default = "192.168.23.0/24"
}

variable "subnet_cidr" {
  default = "192.168.23.0/24"
}

variable "gateway_ip" {
  default = "192.168.23.1"
}

### SECURITY groups settings

variable "sg-bastion" {
  default = ["sg-corentin-bastion"]
}

variable "sg-lan" {
  default = ["sg-corentin-lan"]
}

### KEY PAIR settings

variable "keypair" {
  default = "KeyPair-corentin-kb"
}

### EIP settings

variable "new_eip" {
  description = "Whether or not attach new Elastic IP (public IP) to ECS"
  default     = true
  type        = bool
}

variable "eip_bandwidth" {
  description = "Bandwidth of the EIP in Mbit/s"
  default     = 5
  type        = number
}
