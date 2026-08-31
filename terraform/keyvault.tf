resource "azurerm_key_vault" "learning" {
  name                = "xlli-learning-kv"
  location            = azurerm_resource_group.learning.location
  resource_group_name = azurerm_resource_group.learning.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

resource "azurerm_key_vault_secret" "db_password" {
  name         = "db-password"
  value        = var.postgres_password
  key_vault_id = azurerm_key_vault.learning.id
}