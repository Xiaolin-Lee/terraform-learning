output "resource_group_name" {
  value = azurerm_resource_group.learning.name
}

output "resource_group_location" {
  value = azurerm_resource_group.learning.location
}

output "web_public_ip" {
  value = azurerm_public_ip.web.ip_address
}