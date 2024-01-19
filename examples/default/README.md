This example illustrates the default setup, designed to simplify resource management and deployment.

## Usage: default

```hcl

module "groups" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 0.3"

  groups = {
    demo = {
      name   = module.naming.resource_group.name
      region = "westeurope"
    }
  }
}
```

## Usage: multiple

The example below demonstrates how to create several resource groups.

```hcl
module "groups" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 0.1"

  groups = {
    rg1 = {
      name   = "rg-demo-dev-001"
      region = "westeurope"
    }
    rg2 = {
      name   = "rg-demo-dev-002"
      region = "eastus2"
    }
  }
}
```
