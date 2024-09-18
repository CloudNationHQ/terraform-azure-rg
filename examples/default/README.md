# Default

This example illustrates the default setup, in its simplest form.

## Types

```hcl
groups = map(object({
  name     = string
  location = string
}))
```

## Notes

You can use existing groups by setting use_existing_group at both global and resource levels.
