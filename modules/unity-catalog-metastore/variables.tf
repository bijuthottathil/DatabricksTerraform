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
  default     = false
}

variable "owner" {
  description = "Owner of the metastore"
  type        = string
  default     = "account users"
}


