variable "workspace_name" {
  description = "Name for the Databricks workspace"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the Databricks workspace"
  type        = string
}

variable "sku" {
  description = "SKU for Databricks workspace"
  type        = string
  default     = "premium"
}

variable "vnet_id" {
  description = "ID of the virtual network"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "public_subnet_nsg_association_id" {
  description = "ID of the public subnet NSG association"
  type        = string
}

variable "private_subnet_nsg_association_id" {
  description = "ID of the private subnet NSG association"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Databricks workspace"
  type        = map(string)
  default     = {}
}

