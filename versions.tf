terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}

# Databricks provider for account-level operations (Unity Catalog metastore)
# Uses Azure CLI authentication (requires 'az login')
provider "databricks" {
  alias      = "account"
  host       = "https://accounts.azuredatabricks.net"
  account_id = var.databricks_account_id
}

# Databricks provider for workspace-level operations
# Uses Azure CLI authentication (requires 'az login')
provider "databricks" {
  alias = "workspace"
  host  = module.databricks_workspace.workspace_url
}

