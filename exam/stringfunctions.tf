# chomp removes newline characters at the end of a string.
output "chompexample" {
  value = chomp("hello\n\n")
}
# endswith takes two values: a string to check and a suffix string.
# The function returns true if the first string ends with that exact suffix.
output "endswithexample" {
  value = endswith("hello world", "world")
}
# The format function produces a string by formatting a number of other values
# according to a specification string. It is similar to the printf function in C,
# and other similar functions in other programming languages.
output "formatexample" {
  value = format("Hello, %s", var.name)
}
# formatlist - produces a list of strings by formatting a number
# of other values according to a specification string.
output "formatlistexample" {
  value = formatlist("Hello, %s", ["Joe", "Bob", "Ted", "Allen"])
}


