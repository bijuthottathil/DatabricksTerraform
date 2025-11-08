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

provider "databricks" {
  # Authentication can be done via:
  # 1. Azure CLI: az login
  # 2. Service Principal: Set AZURE_CLIENT_ID, AZURE_CLIENT_SECRET, AZURE_TENANT_ID
  # 3. PAT Token: Set DATABRICKS_HOST and DATABRICKS_TOKEN
  # Host will be automatically detected from workspace URL or set DATABRICKS_HOST
}

