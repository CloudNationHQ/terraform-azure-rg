# Resource Groups

This terraform module enables the efficient creation and management of azure resource groups. By offering customizable options for the name, location, management locks and tags, it brings granular control over your azure environment. Resource groups, functioning as logical containers, are essential for managing workloads and deploying accelerators.

## Goals

The main objective is to create a more logic data structure, achieved by combining and grouping related resources together in a complex object.

The structure of the module promotes reusability. It's intended to be a repeatable component, simplifying the process of building diverse workloads and platform accelerators consistently.

A primary goal is to utilize keys and values in the object that correspond to the REST API's structure. This enables us to carry out iterations, increasing its practical value as time goes on.

A last key goal is to separate logic from configuration in the module, thereby enhancing its scalability, ease of customization, and manageability.

## Non-Goals

These modules are not intended to be complete, ready-to-use solutions; they are designed as components for creating your own patterns.

They are not tailored for a single use case but are meant to be versatile and applicable to a range of scenarios.

Security standardization is applied at the pattern level, while the modules include default values based on best practices but do not enforce specific security standards.

End-to-end testing is not conducted on these modules, as they are individual components and do not undergo the extensive testing reserved for complete patterns or solutions.

## Features

- provides support for both single and multiple resource groups, allowing flexible resource management.
- implements optional management locks for enhanced security
- supports leveraging existing resource groups

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_management_lock.lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_resource_group.groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.existing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_groups"></a> [groups](#input\_groups) | describes resource groups | `any` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | default azure location to be used. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags to be added to the resources | `map(string)` | `{}` | no |
| <a name="input_use_existing_groups"></a> [use\_existing\_groups](#input\_use\_existing\_groups) | use existing resource groups globally | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_groups"></a> [groups](#output\_groups) | Contains all resource groups, existing and new. |
<!-- END_TF_DOCS -->

## Testing

Ensure go and terraform are installed.

Run tests for different usage scenarios by specifying the EXAMPLE environment variable. Usage examples are in the examples directory.

To execute a test, run `make test EXAMPLE=default`

Replace default with the specific example you want to test. These tests ensure the module performs reliably across various configurations.

## Notes

Using a dedicated module, we've developed a naming convention for resources that's based on specific regular expressions for each type, ensuring correct abbreviations and offering flexibility with multiple prefixes and suffixes.

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory.

To update the module's documentation run `make doc`

## Contributing

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md).

## Authors

Module is maintained by [these awesome contributors](https://github.com/cloudnationhq/terraform-azure-rg/graphs/contributors).

## License

MIT Licensed. See [LICENSE](./LICENSE) for full details.
