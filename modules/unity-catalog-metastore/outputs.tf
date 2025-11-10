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

output "storage_credential_id" {
  description = "ID of the storage credential"
  value       = databricks_storage_credential.external_storage.id
}

output "bronze_external_location_id" {
  description = "ID of the bronze external location"
  value       = databricks_external_location.bronze.id
}

output "silver_external_location_id" {
  description = "ID of the silver external location"
  value       = databricks_external_location.silver.id
}

output "gold_external_location_id" {
  description = "ID of the gold external location"
  value       = databricks_external_location.gold.id
}

output "bronze_external_location_url" {
  description = "URL of the bronze external location"
  value       = databricks_external_location.bronze.url
}

output "silver_external_location_url" {
  description = "URL of the silver external location"
  value       = databricks_external_location.silver.url
}

output "gold_external_location_url" {
  description = "URL of the gold external location"
  value       = databricks_external_location.gold.url
}

output "catalog_id" {
  description = "ID of the oilcatalog"
  value       = databricks_catalog.oilcatalog.id
}

output "catalog_name" {
  description = "Name of the oilcatalog"
  value       = databricks_catalog.oilcatalog.name
}

output "bronze_schema_id" {
  description = "ID of the bronze schema"
  value       = databricks_schema.bronze.id
}

output "silver_schema_id" {
  description = "ID of the silver schema"
  value       = databricks_schema.silver.id
}

output "gold_schema_id" {
  description = "ID of the gold schema"
  value       = databricks_schema.gold.id
}

