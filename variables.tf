variable "groups" {
  description = "Contains all resource group configuration"
  type = map(object({
    name               = optional(string)
    location           = optional(string)
    managed_by         = optional(string)
    tags               = optional(map(string))
    use_existing_group = optional(bool)
    management_lock = optional(object({
      name  = optional(string)
      level = string
      notes = optional(string)
    }))
  }))

  validation {
    condition = alltrue([
      for k, v in var.groups : v.location != null || var.location != null
    ])
    error_message = "location must be set on each group or via the module-level var.location."
  }

  validation {
    condition = alltrue([
      for k, v in var.groups : v.management_lock == null || contains(["CanNotDelete", "ReadOnly"], v.management_lock.level)
    ])
    error_message = "management_lock.level must be one of: CanNotDelete, ReadOnly."
  }
}

variable "use_existing_groups" {
  description = "use existing resource groups globally"
  type        = bool
}

variable "location" {
  description = "default azure location to be used."
  type        = string
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
}
