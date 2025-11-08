variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the VNet"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "Address prefixes for subnets"
  type        = map(list(string))
}

variable "tags" {
  description = "Tags to apply to the VNet"
  type        = map(string)
  default     = {}
}

