resource "azurerm_resource_group" "aks-rg" {
  location = local.deployment_region.name
  name     = "${local.base_name}-aks-rg"
}

resource "azurerm_resource_group" "acr-rg" {
  location = local.deployment_region.name
  name     = "${local.base_name}-acr-rg"
}


resource "azurerm_resource_group" "node-rg" {
  location = local.deployment_region.name
  name     = "${local.base_name}-node-rg"
}