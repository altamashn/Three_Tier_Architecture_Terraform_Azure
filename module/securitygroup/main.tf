resource "azurerm_network_security_group" "web-nsg" {
  name                = "web-nsg"
  location            = var.location
  resource_group_name = var.resource_group
  dynamic "security_rule" {
    for_each = local.security_rule
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_address_prefix      = security_rule.value.source_address_prefix
      source_port_range          = security_rule.value.source_port_range
      destination_address_prefix = security_rule.value.destination_address_prefix
      destination_port_range     = security_rule.value.destination_port_range
    }
  }
}
resource "azurerm_subnet_network_security_group_association" "web-nsg-subnet" {
  network_security_group_id = azurerm_network_security_group.web-nsg.id
  subnet_id                 = var.web_subnet_id
}
resource "azurerm_network_security_group" "db-nsg" {
  name                = "db-nsg"
  location            = var.location
  resource_group_name = var.resource_group
  dynamic "security_rule" {
    for_each = var.nsg_rules_db
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_address_prefix      = security_rule.value.source_address_prefix
      source_port_range          = security_rule.value.source_port_range
      destination_address_prefix = security_rule.value.destination_address_prefix
      destination_port_range     = security_rule.value.destination_port_range
    }
  }
}
resource "azurerm_subnet_network_security_group_association" "db-nsg-subnet" {
  network_security_group_id = azurerm_network_security_group.db-nsg.id
  subnet_id                 = var.db_subnet_id
}