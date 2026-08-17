resource "azurerm_public_ip" "web" {
  name                = "web-public-ip"
  location            = azurerm_resource_group.learning.location
  resource_group_name = azurerm_resource_group.learning.name

  allocation_method = "Static"

  sku = "Standard"
}