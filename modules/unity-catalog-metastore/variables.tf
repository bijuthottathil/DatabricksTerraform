variable "metastore_name" {
  description = "Name for the Unity Catalog metastore"
  type        = string
}

variable "storage_root" {
  description = "Storage root path for the metastore (ABFSS path)"
  type        = string
}

variable "region" {
  description = "Azure region for the metastore"
  type        = string
}

variable "workspace_id" {
  description = "Workspace ID to associate the metastore with"
  type        = string
}

variable "force_destroy" {
  description = "Force destroy the metastore even if it contains data"
  type        = bool
  default     = true
}

variable "owner" {
  description = "Owner of the metastore"
  type        = string
  default     = "account users"
}

variable "service_principal_application_id" {
  description = "Application (client) ID of the service principal"
  type        = string
}

variable "service_principal_client_secret" {
  description = "Client secret of the service principal"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "bronze_container_name" {
  description = "Name of the bronze container"
  type        = string
}

variable "silver_container_name" {
  description = "Name of the silver container"
  type        = string
}

variable "gold_container_name" {
  description = "Name of the gold container"
  type        = string
}


