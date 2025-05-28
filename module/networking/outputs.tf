output "network-name" {
  value = azurerm_virtual_network.vnet01.name
}
output "websubnet_id" {
  value = azurerm_subnet.web-subnet.id
}
output "appsubnet_id" {
  value       = azurerm_subnet.app-subnet.id
  description = "Id of appsubnet in the network"
}

output "dbsubnet_id" {
  value       = azurerm_subnet.db-subnet.id
  description = "Id of dbsubnet in the network"
}