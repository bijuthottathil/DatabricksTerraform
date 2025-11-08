output "resource_group_name" {
  description = "Name of the resource group"
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "ID of the resource group"
  value       = module.resource_group.id
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.vnet.vnet_id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = module.vnet.vnet_name
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.vnet.public_subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.vnet.private_subnet_id
}

output "key_vault_id" {
  description = "ID of the Key Vault"
  value       = module.key_vault.id
}

output "key_vault_name" {
  description = "Name of the Key Vault"
  value       = module.key_vault.name
}

output "storage_account_id" {
  description = "ID of the storage account"
  value       = module.storage_account.id
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = module.storage_account.name
}

output "storage_account_primary_dfs_endpoint" {
  description = "Primary DFS endpoint of the storage account"
  value       = module.storage_account.primary_dfs_endpoint
}

output "service_principal_id" {
  description = "ID of the service principal"
  value       = module.service_principal.id
}

output "service_principal_application_id" {
  description = "Application ID of the service principal"
  value       = module.service_principal.application_id
}

output "databricks_workspace_id" {
  description = "ID of the Databricks workspace"
  value       = module.databricks_workspace.id
}

output "databricks_workspace_url" {
  description = "URL of the Databricks workspace"
  value       = module.databricks_workspace.workspace_url
}

output "metastore_storage_account_id" {
  description = "ID of the metastore storage account"
  value       = module.metastore_storage.id
}

output "metastore_storage_account_name" {
  description = "Name of the metastore storage account"
  value       = module.metastore_storage.name
}

output "metastore_storage_primary_dfs_endpoint" {
  description = "Primary DFS endpoint of the metastore storage account"
  value       = module.metastore_storage.primary_dfs_endpoint
}

output "metastore_path" {
  description = "Full path to the metastore storage location"
  value       = module.metastore_storage.metastore_path
}

output "unity_catalog_metastore_id" {
  description = "ID of the Unity Catalog metastore"
  value       = module.unity_catalog_metastore.metastore_id
}

output "unity_catalog_metastore_name" {
  description = "Name of the Unity Catalog metastore"
  value       = module.unity_catalog_metastore.metastore_name
}

output "unity_catalog_metastore_storage_root" {
  description = "Storage root path of the Unity Catalog metastore"
  value       = module.unity_catalog_metastore.storage_root
}

