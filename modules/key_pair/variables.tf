variable "key_name" {
  description = "The name for the key pair"
  type        = string
}

variable "private_key_algorithm" {
  description = "Name of the algorithm to use when generating the private key. Currently-supported values are `RSA` and `ED25519`"
  type        = string
}

variable "secret_name" {
  description = "The secret name for the key pair"
  type        = string
}

variable "resource_specific_tags" {
  description = "Map of tags to assign to specific resources supporting tags. Merged with `tags`."
  type = map(map(string))
}