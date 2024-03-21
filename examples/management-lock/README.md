This example outlines a resource group configuration that includes scoped management locks, improving security by enforcing strict access controls.

```hcl
module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.4"

  suffix = ["demo", "dev"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 0.1"

  groups = {
    demo = {
      name   = module.naming.resource_group.name
      region = "westeurope"

      management_lock = {
        level = "ReadOnly"
      }
    }
  }
}
```
