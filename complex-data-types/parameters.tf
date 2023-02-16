locals {
  my_parameters = [
    {
      "prefix" = "/myprefix"
      "parameters" = [
        {
          "name"  = "myparameter"
          "value" = "myvalue"
        },
        {
          "name"  = "environment"
          "value" = "dev"
        }
      ]
    },
    {
      "prefix" = "/myapp"
      "parameters" = [
        {
          "name"  = "environment"
          "value" = "prod"
        }
      ]
    }
  ]
}


#module "parameters" {
#  source     = "./ssm-parameter"
#  parameters = local.my_parameters
#}

# if environment is a list or environmet = ["Development","Production","Test"]
# then value = element(each.value, 0)

# if environment is a map or 
# environment = {
#   something = "Development"
#   ...
#   ...
# }
# then value = lookup (each.value, "something", "") - you need a 3rd value in case not found
