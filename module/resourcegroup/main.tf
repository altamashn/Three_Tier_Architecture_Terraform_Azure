resource "azurerm_resource_group" "azure-stack-rs" {
  name     = var.name
  location = var.location
}
resource "azurerm_resource_group" "azure-rg" {
  name     = "new896rg"
  location = "westeurope"
}