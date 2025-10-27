# ============================================
# Variable Values
# ============================================

# Replace with your actual subscription ID
subscription_id = "5e47e5a1-7dc4-4abb-87a2-f371200842ea"

# Resource Group
resource_group_name     = "rg-network-hub-spoke"
resource_group_location = "East US"

# VNet Configuration
vnet_hub_name           = "vnet-hub"
vnet_hub_address_space  = ["10.1.0.0/16"]
vnet_hub_location       = "East US"

vnet_spoke1_name           = "vnet-spoke1"
vnet_spoke1_address_space  = ["10.2.0.0/16"]
vnet_spoke1_location       = "West US"

vnet_spoke2_name           = "vnet-spoke2"
vnet_spoke2_address_space  = ["10.3.0.0/16"]
vnet_spoke2_location       = "West Europe"

# Subnet Configuration
subnet_hub_address_prefix    = ["10.1.1.0/24"]
subnet_spoke1_address_prefix = ["10.2.1.0/24"]
subnet_spoke2_address_prefix = ["10.3.1.0/24"]

# Policy Configuration
allowed_locations = ["eastus", "westus", "westeurope"]

allowed_vm_sizes = [
  "Standard_B2s",
  "Standard_B2ms",
  "Standard_D2s_v3",
  "Standard_D4s_v3"
]

required_tag_keys = ["Environment"]

allowed_environment_values = ["Development", "Staging", "Production"]

# Common Tags
tags = {
  Environment = "Production"
  ManagedBy   = "Terraform"
  Project     = "Hub-Spoke-Network"
  CostCenter  = "IT-Infrastructure"
}