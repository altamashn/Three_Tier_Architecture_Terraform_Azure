terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-practice-altamash"
    storage_account_name = "terraformstatealtamash"
    container_name       = "3tier"
    key                  = "3tier.terraform.state"
  }
}