output "metastore_id" {
  description = "ID of the Unity Catalog metastore"
  value       = databricks_metastore.this.id
}

output "metastore_name" {
  description = "Name of the Unity Catalog metastore"
  value       = databricks_metastore.this.name
}

output "storage_root" {
  description = "Storage root path of the metastore"
  value       = databricks_metastore.this.storage_root
}

output "region" {
  description = "Region of the metastore"
  value       = databricks_metastore.this.region
}

