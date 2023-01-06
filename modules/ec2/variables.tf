variable "most_recent" {
  type        = bool
  description = "AMI most recent"
}
variable "owners" {
  type        = list(string)
  description = "Lists of owners of Instance Image"
}
variable "filter_instance_values" {
  type        = list(string)
  description = "List of Values to Filter AMIs"
}
variable "instance_type" {
  type        = string
  description = "the instance type of EC2"
} 
variable "key_pair_name" {
  type        = string
  description = "the key pair name for EC2"
} 
variable "instance_name" {
  type        = string
  description = "the instance name of EC2"
} 
variable "aws_subnet_id" {
  type        = string
  description = "Subnet Id for EC2"
} 
variable "aws_security_group_id" {
  type        = list(string)
  description = "List of Security Group Ids"
}
variable "associate_public_ip_address" {
  type        = bool
  description = "associate public ip address"
}
variable "resource_specific_tags" {
  description = "Map of tags to assign to specific resources supporting tags. Merged with `tags`."
  type = map(map(string))
  default = {}
}