variable "groups" {
  description = "describes resource groups"
  type        = any
  default     = {}
}

variable "use_existing_groups" {
  description = "use existing resource groups globally"
  type        = bool
  default     = false
}

variable "location" {
  description = "default azure location to be used."
  type        = string
  default     = null
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
