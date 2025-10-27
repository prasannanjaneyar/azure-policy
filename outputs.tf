# ============================================
# Outputs
# ============================================

# Resource Group Outputs
output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.network_rg.name
}

output "resource_group_location" {
  description = "Location of the resource group"
  value       = azurerm_resource_group.network_rg.location
}

output "resource_group_id" {
  description = "ID of the resource group"
  value       = azurerm_resource_group.network_rg.id
}

# VNet Hub Outputs
output "vnet_hub_name" {
  description = "Name of Hub VNet"
  value       = azurerm_virtual_network.vnet_hub.name
}

output "vnet_hub_id" {
  description = "ID of Hub VNet"
  value       = azurerm_virtual_network.vnet_hub.id
}

output "vnet_hub_address_space" {
  description = "Address space of Hub VNet"
  value       = azurerm_virtual_network.vnet_hub.address_space
}

# VNet Spoke1 Outputs
output "vnet_spoke1_name" {
  description = "Name of Spoke1 VNet"
  value       = azurerm_virtual_network.vnet_spoke1.name
}

output "vnet_spoke1_id" {
  description = "ID of Spoke1 VNet"
  value       = azurerm_virtual_network.vnet_spoke1.id
}

output "vnet_spoke1_address_space" {
  description = "Address space of Spoke1 VNet"
  value       = azurerm_virtual_network.vnet_spoke1.address_space
}

# VNet Spoke2 Outputs
output "vnet_spoke2_name" {
  description = "Name of Spoke2 VNet"
  value       = azurerm_virtual_network.vnet_spoke2.name
}

output "vnet_spoke2_id" {
  description = "ID of Spoke2 VNet"
  value       = azurerm_virtual_network.vnet_spoke2.id
}

output "vnet_spoke2_address_space" {
  description = "Address space of Spoke2 VNet"
  value       = azurerm_virtual_network.vnet_spoke2.address_space
}

# Subnet Outputs
output "subnet_hub_id" {
  description = "ID of Hub subnet"
  value       = azurerm_subnet.subnet_hub.id
}

output "subnet_spoke1_id" {
  description = "ID of Spoke1 subnet"
  value       = azurerm_subnet.subnet_spoke1.id
}

output "subnet_spoke2_id" {
  description = "ID of Spoke2 subnet"
  value       = azurerm_subnet.subnet_spoke2.id
}

# Policy Outputs
output "policy_allowed_locations_id" {
  description = "ID of Allowed Locations policy assignment"
  value       = azurerm_subscription_policy_assignment.allowed_locations.id
}

output "policy_allowed_vm_sizes_id" {
  description = "ID of Allowed VM Sizes policy assignment"
  value       = azurerm_subscription_policy_assignment.allowed_vm_sizes.id
}

output "policy_require_tag_id" {
  description = "ID of Require Tag policy assignment"
  value       = azurerm_subscription_policy_assignment.require_tag.id
}

output "custom_policy_definition_id" {
  description = "ID of custom policy definition"
  value       = azurerm_policy_definition.allowed_tag_values.id
}

# output "policy_initiative_id" {
#   description = "ID of policy initiative"
#   value       = azurerm_policy_set_definition.network_governance.id
# }

# Summary Output
output "deployment_summary" {
  description = "Summary of deployed resources"
  value = <<-EOT
    ================================================
    DEPLOYMENT SUMMARY
    ================================================
    
    Resource Group: ${azurerm_resource_group.network_rg.name}
    Location: ${azurerm_resource_group.network_rg.location}
    
    VNets Created:
    - ${azurerm_virtual_network.vnet_hub.name} (${azurerm_virtual_network.vnet_hub.address_space[0]}) in ${azurerm_virtual_network.vnet_hub.location}
    - ${azurerm_virtual_network.vnet_spoke1.name} (${azurerm_virtual_network.vnet_spoke1.address_space[0]}) in ${azurerm_virtual_network.vnet_spoke1.location}
    - ${azurerm_virtual_network.vnet_spoke2.name} (${azurerm_virtual_network.vnet_spoke2.address_space[0]}) in ${azurerm_virtual_network.vnet_spoke2.location}
    
    Subnets Created:
    - ${azurerm_subnet.subnet_hub.name} (${azurerm_subnet.subnet_hub.address_prefixes[0]})
    - ${azurerm_subnet.subnet_spoke1.name} (${azurerm_subnet.subnet_spoke1.address_prefixes[0]})
    - ${azurerm_subnet.subnet_spoke2.name} (${azurerm_subnet.subnet_spoke2.address_prefixes[0]})
    
    Policies Applied at Subscription Level:
    - Allowed Locations: East US, West US, West Europe
    - Allowed VM Sizes: B-series, D-series
    - Required Tag: Environment
    - Allowed Tag Values: Development, Staging, Production
    
    ================================================
  EOT
}