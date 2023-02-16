variable "parameters" {
  type = list(object( { 
    prefix = string
    parameters = object ( {
      name = string
      value = string
    } )
  }))
  default = []
}
