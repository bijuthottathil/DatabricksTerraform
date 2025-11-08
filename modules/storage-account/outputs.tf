output "id" {
  description = "ID of the storage account"
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.this.name
}

output "primary_access_key" {
  description = "Primary access key of the storage account"
  value       = azurerm_storage_account.this.primary_access_key
  sensitive   = true
}

output "primary_dfs_endpoint" {
  description = "Primary DFS endpoint of the storage account"
  value       = azurerm_storage_account.this.primary_dfs_endpoint
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint of the storage account"
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "container_name" {
  description = "Name of the databricks-root container"
  value       = azurerm_storage_container.databricks_root.name
}

output "bronze_container_name" {
  description = "Name of the bronze container"
  value       = azurerm_storage_container.bronze.name
}

output "silver_container_name" {
  description = "Name of the silver container"
  value       = azurerm_storage_container.silver.name
}

output "gold_container_name" {
  description = "Name of the gold container"
  value       = azurerm_storage_container.gold.name
}

