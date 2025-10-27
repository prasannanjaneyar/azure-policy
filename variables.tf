# ============================================
# Variable Definitions
# ============================================

variable "subscription_id" {
  description = "Azure Subscription ID for policy assignment"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-network-hub-spoke"
}

variable "resource_group_location" {
  description = "Location for the resource group"
  type        = string
  default     = "East US"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Environment = "Production"
    ManagedBy   = "Terraform"
    Project     = "Hub-Spoke-Network"
  }
}

# VNet Hub Variables
variable "vnet_hub_name" {
  description = "Name of the Hub VNet"
  type        = string
  default     = "vnet-hub"
}

variable "vnet_hub_address_space" {
  description = "Address space for Hub VNet"
  type        = list(string)
  default     = ["10.1.0.0/16"]
}

variable "vnet_hub_location" {
  description = "Location for Hub VNet"
  type        = string
  default     = "East US"
}

# VNet Spoke1 Variables
variable "vnet_spoke1_name" {
  description = "Name of Spoke1 VNet"
  type        = string
  default     = "vnet-spoke1"
}

variable "vnet_spoke1_address_space" {
  description = "Address space for Spoke1 VNet"
  type        = list(string)
  default     = ["10.2.0.0/16"]
}

variable "vnet_spoke1_location" {
  description = "Location for Spoke1 VNet"
  type        = string
  default     = "West US"
}

# VNet Spoke2 Variables
variable "vnet_spoke2_name" {
  description = "Name of Spoke2 VNet"
  type        = string
  default     = "vnet-spoke2"
}

variable "vnet_spoke2_address_space" {
  description = "Address space for Spoke2 VNet"
  type        = list(string)
  default     = ["10.3.0.0/16"]
}

variable "vnet_spoke2_location" {
  description = "Location for Spoke2 VNet"
  type        = string
  default     = "West Europe"
}

# Subnet Variables
variable "subnet_hub_address_prefix" {
  description = "Address prefix for Hub subnet"
  type        = list(string)
  default     = ["10.1.1.0/24"]
}

variable "subnet_spoke1_address_prefix" {
  description = "Address prefix for Spoke1 subnet"
  type        = list(string)
  default     = ["10.2.1.0/24"]
}

variable "subnet_spoke2_address_prefix" {
  description = "Address prefix for Spoke2 subnet"
  type        = list(string)
  default     = ["10.3.1.0/24"]
}

# Policy Variables
variable "allowed_locations" {
  description = "List of allowed Azure locations"
  type        = list(string)
  default     = ["eastus", "westus", "westeurope"]
}

variable "allowed_vm_sizes" {
  description = "List of allowed VM sizes"
  type        = list(string)
  default = [
    "Standard_B2s",
    "Standard_B2ms",
    "Standard_D2s_v3",
    "Standard_D4s_v3",
    "Standard_DS2_v2",
    "Standard_DS3_v2"
  ]
}

variable "required_tag_keys" {
  description = "List of required tag keys"
  type        = list(string)
  default     = ["Environment"]
}

variable "allowed_environment_values" {
  description = "Allowed values for Environment tag"
  type        = list(string)
  default     = ["Development", "Staging", "Production"]
}