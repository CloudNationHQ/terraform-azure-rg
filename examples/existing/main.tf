module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.1"

  suffix = ["demo", "dev"]
}

module "rg" {
  source = "../../"
  #  version = "~> 0.1"

  groups = {
    demo = {
      name     = module.naming.resource_group.name
      location = "westeurope"
    }
    omed = {
      name               = "rg-omed-dev"
      use_existing_group = true
    }
  }
  depends_on = [azurerm_resource_group.rg]
}

output "group" {
  value = module.rg.groups.demo
}

output "existing_group" {
  value = module.rg.groups.omed
}
