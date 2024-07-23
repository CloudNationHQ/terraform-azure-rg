# existing
data "azurerm_resource_group" "existing" {
  for_each = {
    for key, val in var.groups : key => val if var.use_existing_groups ||
    lookup(
      val, "use_existing_group", false
    ) == true
  }

  name = each.value.name
}

# resourcegroups
resource "azurerm_resource_group" "groups" {
  for_each = for key, val in var.groups : key => val
    if try(val.use_existing_group, null) != true || var.use_existing_groups 
  }

  name     = each.value.name
  location = var.region != null ? var.region : each.value.region
  tags     = try(each.value.tags, var.tags, {})
}

# locks
resource "azurerm_management_lock" "lock" {
  for_each = {
    for k, v in var.groups : k => v if try(v.management_lock != null, false)
  }

  name = try(each.value.management_lock.name, "lock-${each.key}")
  scope = try(
    (var.use_existing_groups || lookup(each.value, "use_existing_group", false)) ? data.azurerm_resource_group.existing[each.key].id :
    azurerm_resource_group.groups[each.key].id, null
  )

  lock_level = try(each.value.management_lock.level, "CanNotDelete")
  notes      = try(each.value.management_lock.notes, null)
}
