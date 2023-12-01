resource "azurerm_kubernetes_cluster" "k8s" {
  location            = azurerm_resource_group.aks-rg.location
  name                = "${local.base_name}-aks"
  resource_group_name = azurerm_resource_group.aks-rg.name
  dns_prefix          = "gurjeetsahi"

  service_principal {
    client_id     = "f218f80d-f7ba-4a8f-bcc5-a027b01b4b13"
    client_secret = "zRx8Q~LJczk_RVDBmb6MjLRZFxyRIyRezj30FbtZ"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D2_v2"
    node_count = 2
  }
  linux_profile {
    admin_username = "gurjeet"

    ssh_key {
      key_data = file("ssh-key/id-rsa.pub")
    }
  }
role_based_access_control_enabled = true
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
}


resource "azurerm_kubernetes_cluster_node_pool" "k8snode_pool" {
  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.k8s.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
  max_count = 2
  enable_auto_scaling = true
  #vnet_subnet_id = 

  tags = {
    Environment = "Production"
  }
}

output "azurerm_kubernetes_cluster_node_pool" {
  value = azurerm_kubernetes_cluster_node_pool.k8snode_pool
  
}