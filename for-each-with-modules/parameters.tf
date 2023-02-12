locals {
  my_parameters = {
    environment = "Development"
    version = "1.0"
    mykey = "myvalue"
  }
}

module "parameters" {
  for_each = local.my_parameters
  source = "./ssh-parameter"
  name = each.key
  value = each.value
}

# if environment is a list or environmet = ["Development","Production","Test"]
# then value = element(each.value, 0)

# if environment is a map or 
# environment = {
#   something = "Development"
#   ...
#   ...
# }
# then value = lookup (each.value, "something", "") - you need a 3rd value in case not found

