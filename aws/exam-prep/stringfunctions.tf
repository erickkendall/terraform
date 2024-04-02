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
# indent - adds a given number of spaces to the beginnings
# of all but the first line in a given multi-line string.
output "indentexample" {
  value = indent(2, "[\n  foo,\n  bar,\n]\n")
}
# join - produces a string by concatenating all of the elements
# of the specified list of strings with the specified separator.
output "joinexample" {
  value = join("-", ["foo", "bar", "baz"])
}
# lower converts all cased letters in the given string to lowercase.
output "lowerexample" {
  value = lower("HELLO")
}
# regex - applies a regular expression to a string and returns the matching substrings.
output "regexexample" {
  value = regex("[a-z]+", "53453453.345345aaabbbccc23454")
}
# regexall - applies a regular expression to a string and returns a list of all matches.
output "regexallexample" {
  value = regexall("[a-z]+", "1234abcd5678efgh9")
}
# replace - searches a given string for another given substring,
# and replaces each occurrence with a given replacement string.
output "replaceexample" {
  value = replace("1+2+3+4+5", "+,", "-")
}
# split - produces a list by dividing a given string
# at all occurrences of a given separator.
output "splitexample" {
  value = split(",", "foo,bar,baz")
}
# startswith takes two values: a string to check and a prefix string.
# The function returns true if the string begins with that exact prefix.
output "startswithexample" {
  value = startswith("Hello", "Hello World!")
}
# strcontains - function checks whether a substring is within another string.
# output "strcontainsexample" {
#  value = strcontains("hello world", "wor")
# }
# strrev reverses the characters in a string. Note that the characters are treated as
# Unicode characters (in technical terms, Unicode grapheme cluster boundaries are respected).
output "strrevexample" {
  value = strrev("Hello!")
}
# substr - extracts a substring from a given string by offset and (maximum) length.
output "substrexample" {
  value = substr("Hello, world!", 1, 4)
}
# title converts the first letter of each word in the given string to uppercase.
output "titleexample" {
  value = title("erick kendall")
}
# trim removes the specified set of characters from the start and end of the given string.
output "trimexample" {
  value = trim("!Hello!", "!")
}
# trimprefix removes the specified prefix from the start of the given string.
# If the string does not start with the prefix, the string is returned unchanged.
output "trimprefixexample" {
  value = trimprefix("helloworld", "hello")
}
# trimsuffix removes the specified suffix from the end of the given string.
output "trimsuffixexample" {
  value = trimsuffix("helloworld", "world")
}
# trimspace removes any space characters from the start and end of the given string.
# This function follows the Unicode definition of "space", which includes regular spaces,
# tabs, newline characters, and various other space-like characters.
output "trimspaceexample" {
  value = trimspace("    hello\n\n")
}
# upper converts all cased letters in the given string to uppercase.
output "upperexample" {
  value = upper("hello")
}
