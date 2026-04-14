provider "azurerm" {
  features {}
}

import {
  to = azurerm_resource_group.azure_rg
  id = "/subscriptions/b5dc4dd5-05a8-43f4-86db-6a679c2dee15/resourceGroups/cmtr-wz8ik6ih-mod7-rg"
}

import {
  to = azurerm_storage_account.st_acc
  id = "/subscriptions/b5dc4dd5-05a8-43f4-86db-6a679c2dee15/resourceGroups/cmtr-wz8ik6ih-mod7-rg/providers/Microsoft.Storage/storageAccounts/cmtrwz8ik6ihmod7sa"
}

resource "azurerm_resource_group" "azure_rg" {
  name     = var.rg_name
  location = var.location

  tags = var.tag
}

resource "azurerm_storage_account" "st_acc" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.azure_rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false

  tags = var.tag
}

module "cdn" {
  source          = "./modules/cdn"
  sdn_rg_name     = azurerm_resource_group.azure_rg.name
  sdn_hostname_sa = azurerm_storage_account.st_acc.name

  hostname_frontdoor_end = azurerm_storage_account.st_acc.primary_blob_host
  location               = var.location
  stora_ac_id            = azurerm_storage_account.st_acc.id

  frontdoor_prof_name = var.fd_profile_name
  frontdoor_prof_sku  = var.fd_profile_sku

  frontdoor_endp_name = var.fd_endpoint_name

  frontdoor_orig_gr_name = var.fd_origin_group_name

  frontdoor_orig_name = var.fd_origin_name

  frontdoor_route_name = var.fd_route_name

  tag = var.tag
}