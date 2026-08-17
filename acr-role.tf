resource "azurerm_role_assignment" "vm_acr_pull" {
  scope                = azurerm_container_registry.learning.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_linux_virtual_machine.web.identity[0].principal_id
}