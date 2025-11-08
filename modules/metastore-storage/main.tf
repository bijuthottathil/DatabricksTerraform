resource "azurerm_storage_account" "this" {
  name                     = lower(substr("${substr(var.project_name, 0, 6)}${substr(var.environment, 0, 3)}ms${substr(md5("${var.workspace_name}-${var.location}"), 0, 8)}", 0, 24))
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.tier
  account_replication_type = var.replication_type
  account_kind             = "StorageV2"

  is_hns_enabled = true

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  tags = var.tags
}

resource "azurerm_storage_container" "metastore" {
  name                  = "unitycatalog"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

resource "azurerm_role_assignment" "metastore_blob_contributor_sp" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.service_principal_id
}

resource "azurerm_role_assignment" "metastore_blob_contributor_workspace" {
  count                = var.databricks_workspace_storage_identity != null ? 1 : 0
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.databricks_workspace_storage_identity
}

