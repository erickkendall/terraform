# cidrhost - calculates a full host IP address for a given host number within a given IP network address prefix.
output "cidrhostexample" {
  value = cidrhost("10.12.112.0/20", 16)
}
# cidrnetmask - converts an IPv4 address prefix given in CIDR notation into a subnet mask address.
output "cidernetmaskexample" {
  value = cidrnetmask("172.16.0.0/12")
}
# cidrsubnet - calculates a subnet address within given IP network address prefix.
output "cidrsubnetexample" {
  value = cidrsubnet("172.16.0.0/12", 4, 2)
}
# cidrsubnets calculates a sequence of consecutive IP address ranges within a particular CIDR prefix.
output "cidrsubnetsexample" {
  value = cidrsubnets("10.1.0.0/16", 4, 4, 8, 4)
}
