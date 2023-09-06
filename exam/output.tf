output "my_vars" {
  value = var.apple
}

output "lst_vars" {
  value = [for item in var.lst : item if item != ""]
}

output "map_values" {
  value = { for k, v in var.map_example : k => v }
}

output "map_values_if" {
  value = [for k, v in var.map_example : upper(k) if k == "meat"]
}

output "map_values_3" {
  value = [for k, v in var.map_example : "the key is ${k} and the value is ${v}"]
}

output "mars_one" {
  value = [for m in var.worlds_splat : m.mars_name]
}

output "mars_two" {
  value = var.worlds_splat[*].mars_name
}

output "joinexample" {
  value = join(",", var.joinexample)
}

output "replaceexample" {
  value = replace(var.helloworld, "/w.*d/", "everybody")
}

output "makelower" {
  value = lower(var.allupper)
}

output "makeupper" {
  value = upper(var.alllower)
}

output "chompexample" {
  value = chomp(var.chompexample)
}

output "formatexample" {
  value = format("This string is all upper case, %s", var.allupper)
}

output "regexexample" {
  value = regex("Hello", var.helloworld)
}

output "splitexample" {
  value = split(",", var.splitexample)
}

output "strrevexample" {
  value = strrev(var.splitexample)
}

output "substrexample" {
  value = substr(var.helloworld, 1, 4)
}

output "titleexample" {
  value = title(var.helloworld)
}

output "trimexample" {
  value = trim(var.helloworld, "!")
}

output "trimprefix" {
  value = trim(var.helloworld, "Hello")
}

output "trimsuffix" {
  value = trim(var.helloworld, "world!")
}

output "trimspace" {
  value = trimspace(var.trimspaceexample)
}

output "alltrueexample" {
  value = alltrue(var.alltrueexample)
}
output "anytrueexample" {
  value = anytrue(var.alltrueexample)
}

output "chunklistexample" {
  value = chunklist(var.chunklistexample, 2)
}

output "concatlistexample" {
  value = concat(var.concatexample)
}

output "containsexample" {
  value = contains(var.chunklistexample, "one")
}

output "distinctexample" {
  value = distinct(var.concatexample)
}

output "elementexampleone" {
  value = element(var.concatexample, 3)
}
output "elementexampletwo" {
  value = element(["a", "b", "c", "d", "e"], 3)
}

output "indexexample" {
  value = format("This is the string %s and this is the result %s", var.chunklistexample, index(var.chunklistexample, "three"))
}

output "indexexampletwo" {
  value = index(["a", "b", "c"], "b")
}

output "keuexample" {
  value = keys(var.map_example)
}
output "valueexample" {
  value = values(var.map_example)
}
output "flattenexample" {
  value = flatten(var.flattenexample)
}
output "lengthexample" {
  value = length(var.flattenexample)
}

output "lookupexample" {
  value = lookup(var.map_example, "one", "one not there")
}

# matchkeys

output "mergeexample" {
  value = merge(var.map_example, var.another_map_example)
}

# one returns the first element from a list of one
# or null if the list is empty  returns an error
# if more than one element
output "oneexample" {
  value = one(var.emptylist)
}

output "rangeexample" {
  value = range(3, 9, 2)
}

output "reverseexample" {
  value = reverse(var.random)
}

output "intersectexample" {
  value = setintersection(var.intersectvar)
}
output "setsubtractexample" {
  value = setsubtract(var.subtractvar, var.intersectvar)
}

output "setunionexample" {
  value = setunion(var.subtractvar, var.intersectvar)
}

output "sliceexample" {
  value = slice(var.intersectvar, 1, 3)
}

output "sortexample" {
  value = sort(var.chunklistexample)
}

output "basenameexample" {
  value = basename(var.somefile)
}
output "dirnameexample" {
  value = dirname(var.somefile)
}

output "pathexpandexample" {
  value = pathexpand("~/.ssh/id_rsa.pub")
}
output "abspathexample" {
  value = format("This is the absolute path %s", abspath(path.root))
}

output "templateexample" {
  value = templatefile("/home/ekendall/terraform/exam/network.tpl", { port = 8080, ip_addrs = ["10.0.0.1", "10.0.0.2"] })
}

# sum
# transpose 
# zipmap
# file 
# fileexists
# fileset
# filebase64

# encode and decode


# " items: ${indent(2,"[\n foo,\n bar\n]\n")}"
# join ("", ["foo","bar","apple"]
# regex
# regexall
# lower(string)
# replace
# split("," "foo,bar,baz") # [ "foo","bar","baz" ])
# strrev(string) # reverse a string
# substr(string, start, end)
# title(string) # capitalize start of word
# trim(string, expression)
# trimprefix(string, expression)


locals {
  vm = csvdecode(file("./vm.csv"))
}

output "val" {
  value = { for k, v in local.vm : k => v }
}

#output "val_for_each" {
#  value = { for_each vm in local.vm : vm.VMName => vm }
#}


# abs
output "abs1" {
  value = abs(34)
}
# abs will flip value
output "abs2" {
  value = abs(-12)
}
# floor round down to the nearest whole number
output "floor1" {
  value = floor(4.9)
}
# ceil round up to the nearest whole number
output "celil1" {
  value = ceil(4.9)
}

# log
output "log1" {
  value = log(50, 10)
}

# min
output "min1" {
  value = min(1, 2, 3)
}
# max use ... to expand the collection to individual arguments:
output "max1" {
  value = max([1, 2, 3]...)
}

output "parseintexample" {
  value = parseint("1111", 2)
}

output "powerexample" {
  value = pow(3, 2)
}

output "signumexample" {
  value = "{ signum(3) }"
}