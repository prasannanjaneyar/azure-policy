# ============================================
# Subnets
# ============================================

# Subnet in Hub VNet
resource "azurerm_subnet" "subnet_hub" {
  name                 = "subnet-hub-default"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.vnet_hub.name
  address_prefixes     = var.subnet_hub_address_prefix

  # Note: Subnets don't have tags in Azure
  
  depends_on = [azurerm_virtual_network.vnet_hub]
}

# Subnet in Spoke1 VNet
resource "azurerm_subnet" "subnet_spoke1" {
  name                 = "subnet-spoke1-default"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.vnet_spoke1.name
  address_prefixes     = var.subnet_spoke1_address_prefix

  depends_on = [azurerm_virtual_network.vnet_spoke1]
}

# Subnet in Spoke2 VNet
resource "azurerm_subnet" "subnet_spoke2" {
  name                 = "subnet-spoke2-default"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.vnet_spoke2.name
  address_prefixes     = var.subnet_spoke2_address_prefix

  depends_on = [azurerm_virtual_network.vnet_spoke2]
}