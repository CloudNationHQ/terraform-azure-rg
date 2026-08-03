locals {
  all_groups = merge(azurerm_resource_group.this, data.azurerm_resource_group.existing)
}

# existing
data "azurerm_resource_group" "existing" {
  for_each = {
    for key, val in var.groups : key => val if var.use_existing_groups || val.use_existing_group == true
  }

  name = each.value.name
}

# resource groups
resource "azurerm_resource_group" "this" {
  for_each = var.use_existing_groups ? {} : {
    for key, val in var.groups : key => val if val.use_existing_group != true
  }

  name       = coalesce(each.value.name, each.key)
  location   = coalesce(each.value.location, var.location)
  managed_by = each.value.managed_by

  tags = coalesce(each.value.tags, var.tags)
}

# locks
resource "azurerm_management_lock" "lock" {
  for_each = {
    for k, v in var.groups : k => v if v.management_lock != null
  }

  name  = coalesce(each.value.management_lock.name, "lock-${each.key}")
  scope = local.all_groups[each.key].id

  lock_level = each.value.management_lock.level
  notes      = each.value.management_lock.notes
}
