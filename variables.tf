variable "name" {}
variable "location" {}
variable "vnetcidr" {}
variable "websubnetcidr" {}
variable "appsubnetcidr" {}
variable "dbsubnetcidr" {}
variable "web_host_name" {}
variable "web_username" {}
variable "web_os_password" {}
variable "primary_database" {}
variable "primary_database_admin" {}
variable "primary_database_password" {}
variable "primary_database_version" {}
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