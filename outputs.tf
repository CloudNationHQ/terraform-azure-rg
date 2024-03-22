output "groups" {
  description = "contains all resource groups config"
  value       = azurerm_resource_group.groups
}

output "groups_existing" {
  description = "contains all existing resource groups"
  value = {
    for k, v in var.groups : k => v
    if lookup(
      v, "use_existing_group", false
    )
  }
}
