variable "location" {}
variable "resource_group" {}
variable "web_subnet_id" {}
variable "app_subnet_id" {}
variable "db_subnet_id" {}
variable "nsg_rules_db" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_address_prefix      = string
    source_port_range          = string
    destination_address_prefix = string
    destination_port_range     = string
  }))
}
locals {
  security_rule = [{
    name                       = "ssh-rule-1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
    },
    {
      name                       = "ssh-rule-2"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "Tcp"
      source_address_prefix      = "192.168.3.0/24"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "22"
  }]
}
