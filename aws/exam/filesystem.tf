# abspath takes a string containing a filesystem path and converts it to an absolute path.
# That is, if the path is not absolute, it will be joined with the current working directory.
output "abspathexample" {
  value = format("This is the absolute path %s", abspath(path.root))
}
# dirname takes a string containing a filesystem path and removes the last portion from it.
output "dirnameexample" {
  value = dirname("/home/ekendall/terraform/exam/demo.csv")
}
# pathexpand takes a filesystem path that might begin with a ~ segment, and
# if so it replaces that segment with the current user's home directory path.
output "pathexpandexample" {
  value = pathexpand("~/.ssh/id_rsa.pub")
}
# basename takes a string containing a filesystem path and removes all except the last portion from it.
output "basenameexample" {
  value = basename("/home/ekendall/terraform/exam/demo.csv")
}
# file reads the contents of a file at the given path and returns them as a string.
output "fileexample" {
  value = file("/home/ekendall/terraform/exam/demo.csv")
}
# fileexists determines whether a file exists at a given path.
output "fileexistsexample" {
  value = fileexists("/home/ekendall/terraform/exam/demo.csv")
}
# fileset enumerates a set of regular file names given a path and pattern.
# The path is automatically removed from the resulting set of file names
# and any result still containing path separators always returns
# forward slash (/) as the path separator for cross-system compatibility.
output "filesetexample" {
  value = [for file in fileset("/home/ekendall/terraform/exam", "*.csv") : format("filename: %s", file)]
}
# filebase64 reads the contents of a file at the given path and returns them as a base64-encoded string.
output "filebase64example" {
  value = filebase64("/home/ekendall/terraform/exam/demo.csv")
}
output "templatefileexample" {
  value = templatefile("${path.module}/backends.tftpl", { port = 8080, ip_addrs = ["10.0.0.1", "10.0.0.2"] })
}


