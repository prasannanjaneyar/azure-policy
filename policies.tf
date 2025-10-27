# ============================================
# Azure Policy Definitions and Assignments
# ============================================

# Get current subscription data
data "azurerm_subscription" "current" {}

# ============================================
# Policy 1: Allowed Locations
# ============================================

resource "azurerm_subscription_policy_assignment" "allowed_locations" {
  name                 = "allowed-locations-policy"
  display_name         = "Allowed Locations - East US, West US, West Europe"
  description          = "This policy restricts resource deployment to approved locations only"
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"
  
  parameters = jsonencode({
    listOfAllowedLocations = {
      value = var.allowed_locations
    }
  })

  metadata = jsonencode({
    category = "Compliance"
    version  = "1.0.0"
  })
}

# ============================================
# Policy 2: Allowed VM Sizes
# ============================================

resource "azurerm_subscription_policy_assignment" "allowed_vm_sizes" {
  name                 = "allowed-vm-sizes-policy"
  display_name         = "Allowed Virtual Machine Size SKUs"
  description          = "This policy restricts VM sizes to approved SKUs only"
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/cccc23c7-8427-4f53-ad12-b6a63eb452b3"
  
  parameters = jsonencode({
    listOfAllowedSKUs = {
      value = var.allowed_vm_sizes
    }
  })

  metadata = jsonencode({
    category = "Compute"
    version  = "1.0.0"
  })
}

# ============================================
# Policy 3: Require Tag on Resources
# ============================================

resource "azurerm_subscription_policy_assignment" "require_tag" {
  name                 = "require-environment-tag-policy"
  display_name         = "Require Environment Tag on Resources"
  description          = "This policy requires the 'Environment' tag on all resources"
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/871b6d14-10aa-478d-b590-94f262ecfa99"
  
  parameters = jsonencode({
    tagName = {
      value = "Environment"
    }
  })

  metadata = jsonencode({
    category = "Tags"
    version  = "1.0.0"
  })
}

# ============================================
# Policy 4: Require Tag on Resource Groups
# ============================================

resource "azurerm_subscription_policy_assignment" "require_tag_rg" {
  name                 = "require-environment-tag-rg-policy"
  display_name         = "Require Environment Tag on Resource Groups"
  description          = "This policy requires the 'Environment' tag on all resource groups"
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/96670d01-0a4d-4649-9c89-2d3abc0a5025"
  
  parameters = jsonencode({
    tagName = {
      value = "Environment"
    }
  })

  metadata = jsonencode({
    category = "Tags"
    version  = "1.0.0"
  })
}

# ============================================
# Custom Policy Definition: Allowed Tag Values
# ============================================

resource "azurerm_policy_definition" "allowed_tag_values" {
  name         = "allowed-environment-tag-values"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Allowed Environment Tag Values"
  description  = "This policy restricts the Environment tag to specific values: Development, Staging, Production"

  metadata = jsonencode({
    category = "Tags"
    version  = "1.0.0"
  })

  policy_rule = jsonencode({
    if = {
      allOf = [
        {
          field = "tags['Environment']"
          exists = "true"
        },
        {
          field = "tags['Environment']"
          notIn = ["Development", "Staging", "Production"]
        }
      ]
    }
    then = {
      effect = "deny"
    }
  })
}

# Assign the custom policy
resource "azurerm_subscription_policy_assignment" "allowed_tag_values" {
  name                 = "allowed-environment-values-policy"
  display_name         = "Allowed Environment Tag Values"
  description          = "This policy ensures Environment tag contains only: Development, Staging, or Production"
  subscription_id      = data.azurerm_subscription.current.id
  policy_definition_id = azurerm_policy_definition.allowed_tag_values.id

  metadata = jsonencode({
    category = "Tags"
    version  = "1.0.0"
  })

  depends_on = [azurerm_policy_definition.allowed_tag_values]
}