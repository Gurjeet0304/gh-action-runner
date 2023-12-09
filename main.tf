resource "azurerm_kubernetes_cluster" "k8s" {
  location            = azurerm_resource_group.aks-rg.location
  name                = "${local.base_name}-aks"
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = "gurjeetsahi"

  service_principal {
    client_id     = "f218f80d-f7ba-4a8f-bcc5-a027b01b4b13"
    client_secret = "zRx8Q~LJczk_RVDBmb6MjLRZFxyRIyRezj30FbtZ"
  }
  # api_server_access_profile {
  #   vnet_integration_enabled = true
  #   subnet_id                = azurerm_subnet.subnets["aks"].id
  # }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D2_v2"
    node_count = 2
    vnet_subnet_id = azurerm_subnet.subnets["node"].id
  }
  node_resource_group = "${local.base_name}-nodes-rg"
  linux_profile {
    admin_username = "gurjeet"

    ssh_key {
      key_data = file("ssh-key/id-rsa.pub")
    }
  }
role_based_access_control_enabled = true
  network_profile {
    network_plugin    = "azure"
    network_policy = "azure"
    load_balancer_sku = "standard"
   # service_cidr = subvar.address_space
  }
}
