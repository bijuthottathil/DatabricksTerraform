module "resource_group" {
  source = "./modules/resource-group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "vnet" {
  source = "./modules/vnet"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  vnet_address_space  = var.vnet_address_space
  subnet_prefixes     = var.subnet_address_prefixes
  tags                = var.tags
}

# module "key_vault" {
#   source = "./modules/key-vault"
#
#   resource_group_name = module.resource_group.name
#   location            = module.resource_group.location
#   sku                 = var.key_vault_sku
#   tags                = var.tags
# }

module "service_principal" {
  source = "./modules/service-principal"

  name            = var.service_principal_name
  resource_group_id = module.resource_group.id

  depends_on = [module.resource_group]
}

module "storage_account" {
  source = "./modules/storage-account"

  resource_group_name            = module.resource_group.name
  location                       = module.resource_group.location
  project_name                   = var.project_name
  environment                    = var.environment
  tier                           = var.storage_account_tier
  replication_type               = var.storage_account_replication_type
  enable_hierarchical_namespace  = var.enable_hierarchical_namespace
  service_principal_id           = module.service_principal.id
  tags                           = var.tags

  depends_on = [module.service_principal]
}

module "databricks_workspace" {
  source = "./modules/databricks-workspace"

  workspace_name                      = var.databricks_workspace_name
  resource_group_name                 = module.resource_group.name
  location                            = module.resource_group.location
  sku                                 = var.databricks_sku
  vnet_id                             = module.vnet.vnet_id
  public_subnet_id                    = module.vnet.public_subnet_id
  private_subnet_id                   = module.vnet.private_subnet_id
  public_subnet_nsg_association_id    = module.vnet.public_subnet_nsg_association_id
  private_subnet_nsg_association_id   = module.vnet.private_subnet_nsg_association_id
  tags                                = var.tags
}

module "metastore_storage" {
  source = "./modules/metastore-storage"

  resource_group_name              = module.resource_group.name
  location                         = module.resource_group.location
  project_name                     = var.project_name
  environment                      = var.environment
  workspace_name                   = var.databricks_workspace_name
  tier                             = var.storage_account_tier
  replication_type                 = var.storage_account_replication_type
  service_principal_id             = module.service_principal.id
  tags                             = var.tags

  depends_on = [
    module.service_principal,
    module.databricks_workspace
  ]
}

# Role assignment for Databricks workspace managed identity to access metastore storage
resource "azurerm_role_assignment" "metastore_workspace_access" {
  scope                = module.metastore_storage.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.databricks_workspace.managed_identity_principal_id

  depends_on = [
    module.metastore_storage,
    module.databricks_workspace
  ]
}

module "unity_catalog_metastore" {
  source = "./modules/unity-catalog-metastore"

  providers = {
    databricks.account   = databricks.account
    databricks.workspace = databricks.workspace
  }

  metastore_name                    = var.metastore_name != null ? var.metastore_name : "${var.databricks_workspace_name}-metastore"
  storage_root                      = module.metastore_storage.metastore_path
  region                            = lower(replace(var.location, " ", ""))
  workspace_id                      = module.databricks_workspace.workspace_id
  service_principal_application_id  = module.service_principal.application_id
  service_principal_client_secret   = module.service_principal.password
  tenant_id                         = module.service_principal.tenant_id
  storage_account_name              = module.storage_account.name
  bronze_container_name             = module.storage_account.bronze_container_name
  silver_container_name             = module.storage_account.silver_container_name
  gold_container_name               = module.storage_account.gold_container_name
}

