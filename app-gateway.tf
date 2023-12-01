resource "azurerm_public_ip" "app_gateway_pubip" {
  name                = "gway-pip"
  resource_group_name = azurerm_resource_group.aks-rg.name
  location            = azurerm_resource_group.aks-rg.location
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_application_gateway" "k8s_gw" {
  name                = "k8s_appgw"
  resource_group_name = azurerm_resource_group.aks-rg.name
  location            = azurerm_resource_group.aks-rg.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.frontend.id
  }

  frontend_port {
    name = "feport"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "feip"
    public_ip_address_id = azurerm_public_ip.app_gateway_pubip.id
  }

  backend_address_pool {
    name = "k8s-pool"
  }

  backend_http_settings {
    name                  = "test"
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = "listerner"
    frontend_ip_configuration_name = "feip"
    frontend_port_name             = "feport"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "route"
    rule_type                  = "Basic"
    http_listener_name         = "listerner"
    backend_address_pool_name  = "k8s-pool"
    backend_http_settings_name = "test"
  }
}