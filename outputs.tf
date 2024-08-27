output "groups" {
  description = "Contains all resource groups, existing and new."
  value       = merge(azurerm_resource_group.groups, data.azurerm_resource_group.existing)
}