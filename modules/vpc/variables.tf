variable "vpc_cidr_block" {
  type = string
  description = "CIDR BLOCK IP of VPC"
} 
variable "public_subnet_cidr" {
  type = string
  description = "Subnet CIDR BLOCK IP of VPC"
} 
variable "availability_zone" {
  type = string
  description = "AZ of VPC"
} 
variable "private_subnet_cidr" {
  type = string
  description = "Subnet CIDR BLOCK IP of VPC"
} 
variable "security_group_name" {
  type = string
  description = "Security Group name of VPC"
} 
variable "resource_specific_tags" {
  description = "Map of tags to assign to specific resources supporting tags. Merged with `tags`."
  type = map(map(string))
}