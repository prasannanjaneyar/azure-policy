# ============================================
# Virtual Networks
# ============================================

# Hub VNet (East US)
resource "azurerm_virtual_network" "vnet_hub" {
  name                = var.vnet_hub_name
  location            = var.vnet_hub_location
  resource_group_name = azurerm_resource_group.network_rg.name
  address_space       = var.vnet_hub_address_space

  tags = merge(
    var.tags,
    {
      Network = "Hub"
      Role    = "Central-Hub"
    }
  )

  # Depends on resource group
  depends_on = [azurerm_resource_group.network_rg]
}

# Spoke1 VNet (West US)
resource "azurerm_virtual_network" "vnet_spoke1" {
  name                = var.vnet_spoke1_name
  location            = var.vnet_spoke1_location
  resource_group_name = azurerm_resource_group.network_rg.name
  address_space       = var.vnet_spoke1_address_space

  tags = merge(
    var.tags,
    {
      Network = "Spoke"
      Role    = "Application-Spoke1"
    }
  )

  depends_on = [azurerm_resource_group.network_rg]
}

# Spoke2 VNet (West Europe)
resource "azurerm_virtual_network" "vnet_spoke2" {
  name                = var.vnet_spoke2_name
  location            = var.vnet_spoke2_location
  resource_group_name = azurerm_resource_group.network_rg.name
  address_space       = var.vnet_spoke2_address_space

  tags = merge(
    var.tags,
    {
      Network = "Spoke"
      Role    = "Application-Spoke2"
    }
  )

  depends_on = [azurerm_resource_group.network_rg]
}