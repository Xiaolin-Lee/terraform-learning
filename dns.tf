resource "azurerm_private_dns_zone" "postgres" {
  name                = "xlli-learning.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.learning.name
}
