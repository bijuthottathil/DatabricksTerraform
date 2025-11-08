data "azurerm_client_config" "current" {}

resource "azuread_application" "this" {
  display_name = var.name
}

resource "azuread_service_principal" "this" {
  client_id = azuread_application.this.client_id
}

resource "azuread_service_principal_password" "this" {
  service_principal_id = azuread_service_principal.this.id
}

resource "azurerm_role_assignment" "contributor" {
  scope                = var.resource_group_id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.this.id
}

