

resource "azurerm_virtual_network" "app_gw" {
  name                = "${local.base_name}-vnets"
  location            = azurerm_resource_group.aks-rg.location
  resource_group_name = azurerm_resource_group.aks-rg.name
  address_space       = ["10.1.0.0/22"]

  tags = {
    environment = "Production"
  }
}
resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = azurerm_virtual_network.app_gw.resource_group_name
  virtual_network_name = azurerm_virtual_network.app_gw.name
  address_prefixes       = ["10.1.1.0/24"]
}


# resource "azurerm_virtual_network" "aks_vnet" {
#   name                = "${local.base_name}-vnets"
#   location            = azurerm_kubernetes_cluster_node_pool" "k8snode_pool#azurerm_resource_group.aks-rg.location
#   resource_group_name = azurerm_resource_group.aks-rg.name
#   address_space       = ["10.2.0.0/22"]

#   tags = {
#     environment = "Production"
#   }
# }
# resource "azurerm_subnet" "aks_subnet" {
#   name                 = "aks"
#   resource_group_name  = azurerm_virtual_network.aks_vnet.resource_group_name
#   virtual_network_name = azurerm_virtual_network.aks_vnet.name
#   address_prefixes       = ["10.2.0.0/23"]
# }