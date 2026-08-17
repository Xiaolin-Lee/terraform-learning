resource "azurerm_postgresql_flexible_server" "learning" {
  name                = "xlli-learning-postgres"
  resource_group_name = azurerm_resource_group.learning.name
  location            = azurerm_resource_group.learning.location
  delegated_subnet_id = azurerm_subnet.db.id
  private_dns_zone_id = azurerm_private_dns_zone.postgres.id
  public_network_access_enabled = false

  version    = "16"
  sku_name   = "B_Standard_B1ms"
  storage_mb = 32768

  administrator_login    = "postgresadmin"
  administrator_password = var.postgres_password

  backup_retention_days = 7
  zone = "3"
}

resource "azurerm_postgresql_flexible_server_database" "app" {
  name      = "myapp"
  server_id = azurerm_postgresql_flexible_server.learning.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}