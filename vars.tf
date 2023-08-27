variable "rg_config" {
  type = object({
    create_rg = bool
    name      = string
    location  = string
  })
}
