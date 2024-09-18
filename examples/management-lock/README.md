# Management Lock

This applies a management lock to the resource group.

## Types

```hcl
groups = map(object({
  name     = string
  location = string
  management_lock = optional(object({
    level = string
  }))
}))
```
