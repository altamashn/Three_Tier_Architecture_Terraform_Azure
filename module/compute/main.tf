resource "azurerm_availability_set" "web_availabilty_set" {
  name                = "web_availabilty_set"
  location            = var.location
  resource_group_name = var.resource_group
}
resource "azurerm_network_interface" "web-net-interface" {
  name                = "web-network"
  resource_group_name = var.resource_group
  location            = var.location
  ip_configuration {
    name                          = "web-webserver"
    subnet_id                     = var.web_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_windows_virtual_machine" "web-vm" {
  name                  = "web-vm"
  location              = var.location
  resource_group_name   = var.resource_group
  size                  = "Standard_D2s_v3"
  admin_username        = var.web_username
  admin_password        = var.web_os_password
  network_interface_ids = [azurerm_network_interface.web-net-interface.id]
  availability_set_id   = azurerm_availability_set.web_availabilty_set.id
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
resource "azurerm_app_service_plan" "asp" {
  name                = "app-asp-vm"
  location            = var.location
  resource_group_name = var.resource_group
  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "as" {
  name                = "app-vm896"
  resource_group_name = var.resource_group
  location            = var.location
  app_service_plan_id = azurerm_app_service_plan.asp.id

}