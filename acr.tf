resource "azurerm_container_registry" "acr" {
  name                = "ghacrgsahi"
  resource_group_name = azurerm_resource_group.acr-rg.name
  location            = azurerm_resource_group.acr-rg.location
  sku                 = "Standard"
  admin_enabled       = false
}
