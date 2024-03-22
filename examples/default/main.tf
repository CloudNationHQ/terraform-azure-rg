module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.1"

  suffix = ["demo", "dev"]
}

module "rg" {
  #source  = "cloudnationhq/rg/azure"
  #version = "~> 0.1"
  source = "../../"

  groups = {
    demo = {
      name = "rg-demo-dev-existsniot"
      region = "westeurope"
      #use_existing_group = true
      management_lock = {
        level = "ReadOnly"
      }
    }
  }
}
