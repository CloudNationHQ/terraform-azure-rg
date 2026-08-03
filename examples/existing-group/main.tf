module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.13"

  suffix = ["demo", "dev"]
}

resource "azurerm_resource_group" "existing" {
  name     = "${module.naming.resource_group.name_unique}-existing"
  location = "westeurope"
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 3.0"

  groups = {
    existing = {
      use_existing_group = true
      name               = azurerm_resource_group.existing.name
    }
    demo = {
      name     = module.naming.resource_group.name_unique
      location = "westeurope"
    }
  }
}
