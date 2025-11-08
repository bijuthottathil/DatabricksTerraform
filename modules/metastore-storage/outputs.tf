output "id" {
  description = "ID of the storage account"
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.this.name
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
  description = "Name of the metastore container"
  value       = azurerm_storage_container.metastore.name
}

output "metastore_path" {
  description = "Full path to the metastore storage location"
  value       = "abfss://${azurerm_storage_container.metastore.name}@${azurerm_storage_account.this.name}.dfs.core.windows.net/"
}

