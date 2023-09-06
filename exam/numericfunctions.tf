# abs - returns the absolute value of the given number
output "absexample" {
  value = abs(-14)
}

# ceil - return the closet whole number that is GREATER or equal to the given value
output "ceilexample" {
  value = ceil(4.9)
}

# floor - return the closet whole number that is LESS or equal to the given value
output "ceilexample" {
  value = floor(4.9)
}

# log - returns the logarithm of a given number in a given base.
output "logexample" {
  value = log(50, 10)
}
# max - takes one or more numbers and returns the greatest number from the set.
# use ... to expand the collection to individual arguments:
output "maxexampleone" {
  value = max([12, 13, 52, 8]...)
}
output "maxexampletwo" {
  value = max(12, 13, 52, 8)
}
# min - takes one or more numbers and returns the smallest number from the set.
# use ... to expand the collection to individual arguments:
output "minexampleone" {
  value = min([12, 13, 52, 8]...)
}
output "minexampletwo" {
  value = min(12, 13, 52, 8)
}
# parseint - parses the given string as a representation of an integer in the specified
# base and returns the resulting number. The base must be between 2 and 62 inclusive.
output "parseintexample" {
  value = parseint("00110011", 2)
}

# pow - calculates an exponent, by raising its first argument to the power of the second argument.
output "powexample" {
  value = pow(3, 2)
}

# signum - determines the sign of a number, returning a number between -1 and 1 to represent the sign.
output "sigexample" {
  value = signum(-13)
}

