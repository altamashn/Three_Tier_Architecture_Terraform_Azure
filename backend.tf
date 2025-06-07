terraform {
  backend "azurerm" {
    resource_group_name  = "resourcegroup"
    storage_account_name = "terraformrg10"
    container_name       = "3tierarchitecture"
    key                  = "3tierarchitecture.terraform.state"
  } 
}
