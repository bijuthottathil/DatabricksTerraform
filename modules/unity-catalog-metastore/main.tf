terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.0"
    }
  }
}

resource "databricks_metastore" "this" {
  name          = var.metastore_name
  storage_root  = var.storage_root
  region        = var.region
  force_destroy = var.force_destroy
  owner         = var.owner
}

resource "databricks_metastore_assignment" "this" {
  workspace_id = var.workspace_id
  metastore_id = databricks_metastore.this.id
}

