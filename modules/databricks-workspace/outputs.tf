output "id" {
  description = "ID of the Databricks workspace"
  value       = azurerm_databricks_workspace.this.id
}

output "workspace_id" {
  description = "Workspace ID of the Databricks workspace"
  value       = azurerm_databricks_workspace.this.workspace_id
}

output "workspace_url" {
  description = "URL of the Databricks workspace"
  value       = azurerm_databricks_workspace.this.workspace_url
}

output "workspace_name" {
  description = "Name of the Databricks workspace"
  value       = azurerm_databricks_workspace.this.name
}

output "storage_account_identity" {
  description = "The Principal ID of the Managed Identity for the storage account, if available."
  value       = try(azurerm_databricks_workspace.this.storage_account_identity[0].principal_id, "")
}

