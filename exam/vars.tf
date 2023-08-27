variable "apple" {
  type    = string
  default = "apple"
}

variable "lst" {
  type    = list(any)
  default = ["", "", "one", "two", "three"]
}

variable "map_example" {
  type = map(any)
  default = {
    "meat" : "turkey",
    "veggie" : "brocoli",
    "drink" : "soda",
    "desert" : "cake"
  }
}

variable "another_map_example" {
  type = map(any)
  default = {
    "meat" : "bologna",
    "veggie" : "carrots",
    "drink" : "water",
    "desert" : "pudding"
  }
}

variable "worlds_splat" {
  type = list(any)
  default = [
    { "mars_name" : "barsoon", "earth_name" : "mars" },
    { "mars_name" : "jasoom", "earth_name" : "earth" },
    { "mars_name" : "sasoom", "earth_name" : "jupiter" },
    { "mars_name" : "cosoom", "earth_name" : "venus" }
  ]
}

variable "plans_object" {
  type = object({
    planA = string
    planB = string
    planC = string
  })
  default = {
    planA = "10 dollars"
    planB = "20 dollars"
    planC = "30 dollars"
  }
}

variable "random" {
  type    = tuple([string, number, bool]) # must 
  default = ["hello", 3, false]           # must match order
}

variable "helloworld" {
  type    = string
  default = "Hello, world!"
}

variable "joinexample" {
  type    = list(any)
  default = ["foo", "bar", "baz"]
}

variable "allupper" {
  type    = string
  default = "ALLUPPER"
}

variable "alllower" {
  type    = string
  default = "ALLLOWER"
}

variable "chompexample" {
  type    = string
  default = "Hello, world!\n\n"
}

variable "splitexample" {
  type = string
  default = "one,two,three" 
}

variable "trimspaceexample" {
  type = string
  default = " this has to many spaces   "
}

variable "alltrueexample" {
  type = list
  default = [true,false]
}

variable "chunklistexample" {
  type = list
  default = ["one","two","three","four","five","six"]
}

variable "concatexample" {
  type = list
  default = ["one","two", "", "", "three","four","five","six", ""]
}

variable "flattenexample" {
  type = list
  default = [ [1,3,5], ["one","two","three"], ["apple","orange"] ]
}

variable "emptylist" {
  type = list
  default = []
}

variable "intersectvar" {
  type = list
  default = [["a","b","c"], ["a","f","g"],["a","b","x"]]
}
variable "subtractvar" {
  type = list
  default = [["a","b","c"], ["a","f","g"]]
}

# abs
# min
# max
# floor
# celing
# log
# parseint ("100", 10) is 100 (number,base)
# pow # power
# signum # sign of a number

# String
# chomp removes new line characters at the end of a string
# format format ("there are %d lights",4)
# formatlist("hello %s", ["bob","ted","alice" ] )

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
