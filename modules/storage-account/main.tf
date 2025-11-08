resource "azurerm_storage_account" "this" {
  name                     = lower(substr("${var.project_name}${var.environment}${substr(md5("${var.resource_group_name}-${var.location}"), 0, 8)}", 0, 24))
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.tier
  account_replication_type = var.replication_type
  account_kind             = "StorageV2"

  is_hns_enabled = var.enable_hierarchical_namespace

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  tags = var.tags
}

resource "azurerm_storage_container" "databricks_root" {
  name                  = "databricks-root"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "bronze" {
  name                  = "bronze"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "silver" {
  name                  = "silver"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "gold" {
  name                  = "gold"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

resource "azurerm_role_assignment" "bronze_blob_contributor" {
  scope                = "${azurerm_storage_account.this.id}/blobServices/default/containers/${azurerm_storage_container.bronze.name}"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.service_principal_id
}

resource "azurerm_role_assignment" "silver_blob_contributor" {
  scope                = "${azurerm_storage_account.this.id}/blobServices/default/containers/${azurerm_storage_container.silver.name}"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.service_principal_id
}

resource "azurerm_role_assignment" "gold_blob_contributor" {
  scope                = "${azurerm_storage_account.this.id}/blobServices/default/containers/${azurerm_storage_container.gold.name}"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.service_principal_id
}

