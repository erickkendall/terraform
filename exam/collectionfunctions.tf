# alltrue - returns true if all elements in a given collection are true or "true".
# It also returns true if the collection is empty.
output "alltrueexample" {
  value = alltrue([true, true])
}
# anytrue - returns true if any element in a given collection is true or "true".
# It also returns false if the collection is empty.
output "anytrueexample" {
  value = anytrue([true, false])
}
# chunklist - splits a single list into fixed-size chunks, returning a list of lists.
output "chunklistexample" {
  value = chunklist(["a", "b", "c", "d", "e"], 2)
}
# coalesce takes any number of arguments and returns the first one that isn't null or an empty string.
output "coalesceexample" {
  value = coalesce(["", "", "a", "b", "c"]...)
}
# coalescelist takes any number of list arguments and returns the first one that isn't empty.
output "coalescelistexample" {
  value = coalescelist(["a", "b"], ["c", "d"])
}
output "compactexample" {
  value = compact(["a", "b", "c", "d", null, "c", ""])
}
# concat takes two or more lists and combines them into a single list.
output "concatexample" {
  value = concat(["a", "b"], ["c", "d"], ["e", "f"])
}
# contains determines whether a given list or set contains a given single value as one of its elements.
output "containsexample" {
  value = contains(["a", "b", "c", "d", "e", "f"], "a")
}
