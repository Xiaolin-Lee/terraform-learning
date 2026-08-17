resource "azurerm_storage_account" "learning" {
  name                = "xiaolinstorage2026"
  resource_group_name = azurerm_resource_group.learning.name
  location            = azurerm_resource_group.learning.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
}