resource "azurerm_virtual_network" "learning" {
  name                = "learning-vnet"
  location            = azurerm_resource_group.learning.location
  resource_group_name = azurerm_resource_group.learning.name

  address_space = [
    "10.0.0.0/16"
  ]
}

resource "azurerm_subnet" "web" {
  name = "web-subnet"

  resource_group_name = azurerm_resource_group.learning.name

  virtual_network_name = azurerm_virtual_network.learning.name

  address_prefixes = [
    "10.0.1.0/24"
  ]
}

resource "azurerm_subnet" "db" {
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.learning.name
  virtual_network_name = azurerm_virtual_network.learning.name

  address_prefixes = ["10.0.2.0/24"]

  delegation {
    name = "postgres-delegation"

    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgres" {
  name                  = "postgres-vnet-link"
  private_dns_zone_name = azurerm_private_dns_zone.postgres.name
  resource_group_name   = azurerm_resource_group.learning.name
  virtual_network_id    = azurerm_virtual_network.learning.id
}