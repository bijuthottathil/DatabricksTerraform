terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.0"
      configuration_aliases = [
        databricks.account,
        databricks.workspace
      ]
    }
  }
}

# Create metastore using account-level provider
resource "databricks_metastore" "this" {
  provider      = databricks.account
  name          = var.metastore_name
  storage_root  = var.storage_root
  region        = var.region
  force_destroy = var.force_destroy
  owner         = var.owner
}

resource "databricks_metastore_assignment" "this" {
  provider     = databricks.account
  workspace_id = var.workspace_id
  metastore_id = databricks_metastore.this.id
}

# Storage Credential for Azure Service Principal
resource "databricks_storage_credential" "external_storage" {
  provider = databricks.workspace
  name     = "${var.metastore_name}-storage-credential"
  azure_service_principal {
    directory_id   = var.tenant_id
    application_id = var.service_principal_application_id
    client_secret  = var.service_principal_client_secret
  }
  comment = "Storage credential for external bronze, silver, and gold containers"

  depends_on = [databricks_metastore_assignment.this]
}

# External Location for Bronze Container
resource "databricks_external_location" "bronze" {
  provider        = databricks.workspace
  name            = "bronze"
  url             = "abfss://${var.bronze_container_name}@${var.storage_account_name}.dfs.core.windows.net/"
  credential_name = databricks_storage_credential.external_storage.id
  comment         = "External location for bronze layer data"
  force_destroy   = true
}

# External Location for Silver Container
resource "databricks_external_location" "silver" {
  provider        = databricks.workspace
  name            = "silver"
  url             = "abfss://${var.silver_container_name}@${var.storage_account_name}.dfs.core.windows.net/"
  credential_name = databricks_storage_credential.external_storage.id
  comment         = "External location for silver layer data"
  force_destroy   = true
}

# External Location for Gold Container
resource "databricks_external_location" "gold" {
  provider        = databricks.workspace
  name            = "gold"
  url             = "abfss://${var.gold_container_name}@${var.storage_account_name}.dfs.core.windows.net/"
  credential_name = databricks_storage_credential.external_storage.id
  comment         = "External location for gold layer data"
  force_destroy   = true
}

# Catalog for Oil Data
resource "databricks_catalog" "oilcatalog" {
  provider      = databricks.workspace
  metastore_id  = databricks_metastore.this.id
  name          = "oilcatalog"
  comment       = "Catalog for oil data with bronze, silver, and gold schemas"
  force_destroy = true
  properties = {
    purpose = "oil_data_management"
  }

  depends_on = [databricks_metastore_assignment.this]
}

# Bronze Schema
resource "databricks_schema" "bronze" {
  provider      = databricks.workspace
  catalog_name  = databricks_catalog.oilcatalog.name
  name          = "bronze"
  comment       = "Bronze layer schema for raw oil data"
  force_destroy = true
  properties = {
    layer = "bronze"
  }
  storage_root = databricks_external_location.bronze.url

  depends_on = [databricks_catalog.oilcatalog]
}

# Silver Schema
resource "databricks_schema" "silver" {
  provider      = databricks.workspace
  catalog_name  = databricks_catalog.oilcatalog.name
  name          = "silver"
  comment       = "Silver layer schema for cleaned and validated oil data"
  force_destroy = true
  properties = {
    layer = "silver"
  }
  storage_root = databricks_external_location.silver.url

  depends_on = [databricks_catalog.oilcatalog]
}

# Gold Schema
resource "databricks_schema" "gold" {
  provider      = databricks.workspace
  catalog_name  = databricks_catalog.oilcatalog.name
  name          = "gold"
  comment       = "Gold layer schema for aggregated and business-ready oil data"
  force_destroy = true
  properties = {
    layer = "gold"
  }
  storage_root = databricks_external_location.gold.url

  depends_on = [databricks_catalog.oilcatalog]
}

