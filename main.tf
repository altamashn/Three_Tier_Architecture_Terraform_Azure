module "resourcegroup" {
  source   = "./module/resourcegroup"
  name     = var.name
  location = var.location
}
module "networking" {
  source         = "./module/networking"
  resource_group = module.resourcegroup.resource_group_name
  location       = var.location
  websubnetcidr  = var.websubnetcidr
  appsubnetcidr  = var.appsubnetcidr
  dbsubnetcidr   = var.dbsubnetcidr
  vnetcidr       = var.vnetcidr
}
module "securitygroup" {
  source         = "./module/securitygroup"
  resource_group = module.resourcegroup.resource_group_name
  location       = module.resourcegroup.location_id
  web_subnet_id  = module.networking.websubnet_id
  app_subnet_id  = module.networking.appsubnet_id
  db_subnet_id   = module.networking.dbsubnet_id
  nsg_rules_db   = var.nsg_rules_db
}
module "compute" {
  source          = "./module/compute"
  location        = var.location
  resource_group  = module.resourcegroup.resource_group_name
  web_os_password = var.web_os_password
  web_subnet_id   = module.networking.websubnet_id
  web_username    = var.web_username
}
module "database" {
  source                    = "./module/database"
  location                  = module.resourcegroup.location_id
  resource_group            = module.resourcegroup.resource_group_name
  primary_database          = var.primary_database
  primary_database_version  = var.primary_database_version
  primary_database_admin    = var.primary_database_admin
  primary_database_password = var.primary_database_password
}
