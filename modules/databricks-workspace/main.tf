# Placeholder for Databricks workspace
# This is a placeholder implementation with VNet injection support

resource "azurerm_databricks_workspace" "this" {
  name                = var.workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku

  # VNet injection configuration
  custom_parameters {
    public_subnet_name                              = split("/", var.public_subnet_id)[length(split("/", var.public_subnet_id)) - 1]
    private_subnet_name                             = split("/", var.private_subnet_id)[length(split("/", var.private_subnet_id)) - 1]
    virtual_network_id                              = var.vnet_id
    public_subnet_network_security_group_association_id  = var.public_subnet_nsg_association_id
    private_subnet_network_security_group_association_id = var.private_subnet_nsg_association_id
    no_public_ip                                    = false
  }

  tags = var.tags
}

