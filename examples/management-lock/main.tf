module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.13"

  suffix = ["demo", "dev"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 3.0"

  use_existing_groups = false
  location            = null
  tags                = { environment = "demo" }

  groups = {
    demo = {
      name     = module.naming.resource_group.name_unique
      location = "westeurope"

      management_lock = {
        level = "ReadOnly"
      }
    }
  }
}
