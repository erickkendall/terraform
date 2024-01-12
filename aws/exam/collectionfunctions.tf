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
# distinct takes a list and returns a new list with any duplicate elements removed.
output "distinctexample" {
  value = distinct(["a", "b", "c", "d", "e", "f"])
}
# element retrieves a single element from a list.
output "elementexample" {
  value = element(["a", "b", "c"], 1)
}
# flatten takes a list and replaces any elements that are lists with a flattened sequence of the list contents.
output "flattenexample" {
  value = flatten([["a", "b"], [], ["c", "d"], ["e", "f"]])
}
# index - finds the element index for a given value in a list.
output "indexexample" {
  value = index(["a", "b", "c"], "b")
}
# keys takes a map and returns a list containing the keys from that map.
output "keysexample" {
  value = keys({ a = 1, b = 2, c = 3 })
}
# length determines the length of a given list, map, or string.
output "lengthexample" {
  value = length(["a", "b", "c"])
}
# lookup retrieves the value of a single element from a map, given its key.
# If the given key does not exist, the given default value is returned instead.
output "lookupexample" {
  value = lookup({ a = "ay", b = "bee" }, "a", "what?")
}
# matchkeys constructs a new list by taking a subset of elements from one list
# whose indexes match the corresponding indexes of values in another list.
output "matchkeysexample_one" {
  value = matchkeys(["i-123", "i-abc", "i-def"], ["us-west", "us-east", "us-east"], ["us-east"])
}
# If the result ordering is not significant, you can achieve a similar result using a for expression with a map:
output "matchkeysexample_two" {
  value = [for i, z in { "i-123" = "us-west", "i-abc" = "us-east", "i-def" = "us-east" } : i if z == "us-east"]
}
# merge takes an arbitrary number of maps or objects, and returns a single
# map or object that contains a merged set of elements from all arguments.
#
# If more than one given map or object defines the same key or attribute, then
# the one that is later in the argument sequence takes precedence. If the argument
# types do not match, the resulting type will be an object matching the type structure
# of the attributes after the merging rules have been applied.
output "mergeexample" {
  value = merge({ a = "b", c = "d" }, { e = "f", c = "z" })
}
# one takes a list, set, or tuple value with either zero or one elements.
# If the collection is empty, one returns null. Otherwise, one returns the
# first element. If there are two or more elements then one will return an error.

# range generates a list of numbers using a start value, a limit value, and a step value.
output "rangeexample" {
  value = [for i in range(2, 20, 2) : format("%d", i)]
}
# reverse takes a sequence and produces a new sequence of the same length
# with all of the same elements as the given sequence but in reverse order.
output "reverseexample" {
  value = reverse([1, 2, 3])
}
# The setintersection function takes multiple sets and produces a single set
# containing only the elements that all of the given sets have in common.
# In other words, it computes the intersection of the sets.
output "setintersectionexample" {
  value = setintersection(["a", "b"], ["b", "c"], ["b", "d"])
}
# The setproduct function finds all of the possible combinations of elements
# from all of the given sets by computing the Cartesian product.
output "setproductexample" {
  value = setproduct(["development", "staging", "production"], ["app1", "app2"])
}
# The setsubtract function returns a new set containing the elements from
# the first set that are not present in the second set. In other words,
# it computes the relative complement of the second set.
output "setsubtractexample_one" {
  value = setsubtract(["a", "b", "c"], ["a", "c"])
}
# Set Difference (Symmetric Difference)
output "setsubtractexample_two" {
  value = setunion(setsubtract(["a", "b", "c"], ["a", "c", "d"]), setsubtract(["a", "c", "d"], ["a", "b", "c"]))
}
# The setunion function takes multiple sets and produces a single set containing the
# elements from all of the given sets. In other words, it computes the union of the sets.
output "setunionexample" {
  value = setunion(["a", "b"], ["b", "c"], ["d"])
}
# slice - extracts some consecutive elements from within a list.
output "sliceexample" {
  value = slice(["a", "b", "c", "d"], 1, 3)
}
# sort - takes a list of strings and returns a new list with those strings sorted lexicographically.
output "sortexample" {
  value = sort(["a", "b", "c", "d"])
}
# sum - takes a list or set of numbers and returns the sum of those numbers.
output "sumexample" {
  value = sum([1, 3, 5, 9, 11, 13])
}
# transpose takes a map of lists of strings and swaps the keys and values
# to produce a new map of lists of strings.
output "transposeexample" {
  value = transpose({ "a" = ["1", "2"], "b" = ["2", "3"] })
}
# values takes a map and returns a list containing the values of the elements in that map.
output "valuesexample" {
  value = values({ a = 3, b = 7 })
}
# zipmap constructs a map from a list of keys and a corresponding list of values.
output "zipmapexample" {
  value = zipmap(["a", "b"], [1, 2])
}
