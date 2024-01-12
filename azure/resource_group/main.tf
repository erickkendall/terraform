resource "azure_resource_group" "demo_rg" {
  count = var.rg_config.create_rg ? 1 : 0 
  name = var.rg_config.name
}
