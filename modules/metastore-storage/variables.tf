variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the storage account"
  type        = string
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "workspace_name" {
  description = "Databricks workspace name"
  type        = string
}

variable "tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = "Tags to apply to the storage account"
  type        = map(string)
  default     = {}
}

variable "service_principal_id" {
  description = "Service Principal ID for Storage Blob Data Contributor role"
  type        = string
}

variable "databricks_workspace_storage_identity" {
  description = "Databricks workspace storage identity ID for Storage Blob Data Contributor role"
  type        = string
  default     = null
}

