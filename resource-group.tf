# ============================================
# Resource Group
# ============================================

resource "azurerm_resource_group" "network_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = merge(
    var.tags,
    {
      Purpose = "Network Hub-Spoke Infrastructure"
    }
  )
}