resource "azurerm_virtual_network" "vnet01" {
  name                = "vnet01"
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = [var.vnetcidr]
}
resource "azurerm_subnet" "web-subnet" {
  name                 = "web-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = [var.websubnetcidr]
}
resource "azurerm_subnet" "app-subnet" {
  name                 = "app-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.appsubnetcidr]
}

resource "azurerm_subnet" "db-subnet" {
  name                 = "db-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.dbsubnetcidr]
}