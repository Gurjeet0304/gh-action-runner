terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}
provider "azurerm" {
  #alias = "gurjeet"    
  client_id       = "f218f80d-f7ba-4a8f-bcc5-a027b01b4b13"
  client_secret   = "zRx8Q~LJczk_RVDBmb6MjLRZFxyRIyRezj30FbtZ"
  subscription_id = "0303f8c5-2ea3-4d68-9ec8-f53794874ccd"
  tenant_id       = "4f020855-7247-49a5-b98f-a9d014167503"
  #storage_use_azuread = true

  features {}


}

provider "azurerm" {
  alias = "shared"    
  #client_id       = "f218f80d-f7ba-4a8f-bcc5-a027b01b4b13"
  #client_secret   = "zRx8Q~LJczk_RVDBmb6MjLRZFxyRIyRezj30FbtZ"
  subscription_id = "bce6f5c5-7dde-435d-aadc-a068246060cf"
  tenant_id       = "4f020855-7247-49a5-b98f-a9d014167503"
  #storage_use_azuread = true



  features {
    key_vault {
      purge_soft_delete_on_destroy               = false
      purge_soft_deleted_certificates_on_destroy = false
      purge_soft_deleted_keys_on_destroy         = false
      purge_soft_deleted_secrets_on_destroy      = false
    }
  }


}