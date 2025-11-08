output "id" {
  description = "Object ID of the service principal"
  value       = azuread_service_principal.this.id
}

output "application_id" {
  description = "Application ID (client ID) of the service principal"
  value       = azuread_service_principal.this.client_id
}

output "application_object_id" {
  description = "Object ID of the Azure AD application"
  value       = azuread_application.this.object_id
}

output "password" {
  description = "Password (client secret) of the service principal"
  value       = azuread_service_principal_password.this.value
  sensitive   = true
}

output "tenant_id" {
  description = "Tenant ID"
  value       = data.azurerm_client_config.current.tenant_id
}

