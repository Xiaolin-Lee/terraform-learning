resource "azurerm_network_security_group" "web" {

  name = "web-nsg"

  location = azurerm_resource_group.learning.location

  resource_group_name = azurerm_resource_group.learning.name

  security_rule {

    name = "AllowSSH"

    priority = 100

    direction = "Inbound"

    access = "Allow"

    protocol = "Tcp"

    source_port_range = "*"

    destination_port_range = "22"

    source_address_prefix = "*"

    destination_address_prefix = "*"

  }

}

resource "azurerm_subnet_network_security_group_association" "web" {

  subnet_id = azurerm_subnet.web.id

  network_security_group_id = azurerm_network_security_group.web.id
}

resource "azurerm_network_security_rule" "allow_http" {
  name                        = "AllowHTTP"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.learning.name
  network_security_group_name = azurerm_network_security_group.web.name
}

resource "azurerm_network_security_rule" "allow_8080" {
  name                        = "Allow8080"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range           = "*"
  destination_port_range      = "8080"

  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.learning.name
  network_security_group_name = azurerm_network_security_group.web.name
}