This example illustrates the default setup, designed to simplify resource management and deployment.

## Usage: default

```hcl

module "groups" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 0.5"

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

## Usage: existing

Existing groups can also be leveraged as demonstrated below:

```hcl
module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 0.1"

  groups = {
    demo = {
      name               = "rg-demo-dev"
      use_existing_group = true
      management_lock = {
        level = "ReadOnly"
      }
    }
  }
}
```
