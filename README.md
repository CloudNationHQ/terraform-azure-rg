# Resource Groups

This terraform module enables the efficient creation and management of azure resource groups. By offering customizable options for the name, location, management locks and tags, it brings granular control over your azure environment. Resource groups, functioning as logical containers, are essential for managing workloads and deploying accelerators.

## Goals

The main objective is to create a more logic data structure, achieved by combining and grouping related resources together in a complex object.

The structure of the module promotes reusability. It's intended to be a repeatable component, simplifying the process of building diverse workloads and platform accelerators consistently.

A primary goal is to utilize keys and values in the object that correspond to the REST API's structure. This enables us to carry out iterations, increasing its practical value as time goes on.

A last key goal is to separate logic from configuration in the module, thereby enhancing its scalability, ease of customization, and manageability.

## Features

- provides support for both single and multiple resource groups, allowing flexible resource management.
- implements optional management locks for enhanced security

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.61 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.61 |

## Resources

| Name | Type |
| :-- | :-- |
| [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_management_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |

## Inputs

| Name | Description | Type | Required |
| :-- | :-- | :-- | :-- |
| `groups` | describes resource group related configuration | object | yes |

## Outputs

| Name | Description |
| :-- | :-- |
| `groups` | contains all resource group configuration |

## Testing

## Authors

Module is maintained by [these awesome contributors](https://github.com/cloudnationhq/terraform-azure-rg/graphs/contributors).

## License

MIT Licensed. See [LICENSE](https://github.com/cloudnationhq/terraform-azure-rg/blob/main/LICENSE) for full details.
