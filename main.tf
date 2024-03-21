# resourcegroups
resource "azurerm_resource_group" "groups" {
  for_each = var.groups

  name     = each.value.name
  location = try(var.region, each.value.region)
  tags     = try(var.tags, each.value.tags, {})
}

# locks
resource "azurerm_management_lock" "lock" {
  for_each = {
    for k, v in var.groups : k => v if try(v.management_lock != null, false)
  }
  name       = "lock-${each.key}"
  scope      = azurerm_resource_group.groups[each.key].id
  lock_level = try(each.value.management_lock.level, "CanNotDelete")
  notes      = try(each.value.management_lock.notes, null)
}
