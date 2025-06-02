

data "azurerm_key_vault" "keyvault" {
  name = "terraform-cred-1"
  resource_group_name = "resourcegroup"
}
data "azurerm_key_vault_secret" "clientid" {
  name = "clientid"
  key_vault_id = data.azurerm_key_vault.name.id
}
data "azurerm_key_vault_secret" "secretid" {
  name = "clientsecret"
  key_vault_id = data.azurerm_key_vault.name.id
}
data "azurerm_key_vault_secret" "subscriptionid" {
  name = "susbcriptionid"
  key_vault_id = data.azurerm_key_vault.name.id
}
data "azurerm_key_vault_secret" "tenantid" {
  name = "tenantid"
  key_vault_id = data.azurerm_key_vault.name.id
}

