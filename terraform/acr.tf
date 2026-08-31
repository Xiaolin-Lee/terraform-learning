resource "azurerm_container_registry" "learning" {
  name                = "xiaolinterraformacr01"
  resource_group_name = azurerm_resource_group.learning.name
  location            = azurerm_resource_group.learning.location
  sku                 = "Basic"
  admin_enabled       = true
}