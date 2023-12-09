

resource "azurerm_virtual_network" "app_gw" {
  name                = "${local.base_name}-vnets"
  location            = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  address_space       = ["10.1.0.0/21"]

  tags = {
    environment = "Production"
  }
}
resource "azurerm_subnet" "subnets" {
  for_each = local.cidr
  
  name                 = each.key
  resource_group_name  = azurerm_virtual_network.app_gw.resource_group_name
  virtual_network_name = azurerm_virtual_network.app_gw.name
  address_prefixes       = [cidrsubnet("10.1.0.0/21", 2 , each.value)]
}
