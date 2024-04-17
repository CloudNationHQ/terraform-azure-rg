output "groups" {
  description = "contains all resource groups config"
  value       = azurerm_resource_group.groups
}

output "groups_existing" {
  description = "Contains all resource groups considered existing based on global and local flags."
  value = var.use_existing_groups ? var.groups : {
    for k, v in var.groups : k => v if lookup(v, "use_existing_group", true)
  }
}
