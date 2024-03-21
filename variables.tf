variable "groups" {
  description = "describes resource groups"
  type        = any
  default     = {}
}

variable "region" {
  description = "default azure region to be used."
  type        = string
  default     = null
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
